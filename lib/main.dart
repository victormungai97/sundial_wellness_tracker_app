import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sundial_wellness_tracker/bloc/observer.dart';
import 'package:sundial_wellness_tracker/firebase_options.dart';
import 'package:sundial_wellness_tracker/navigation/navigation.dart';
import 'package:sundial_wellness_tracker/services/networking/networking.dart';
import 'package:sundial_wellness_tracker/utils/logging_utils.dart';
import 'package:sundial_wellness_tracker/utils/network_interceptor_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final logger = LoggingUtils();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (!kIsWeb) {
    await LoggingUtils.crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);
  }
  // Non-async exceptions
  FlutterError.onError = logger.logError;
  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stackTrace) {
    logger.logError(error, stackTrace: stackTrace);
    return true;
  };

// set up persistent offline storage
  final appDirectory = kIsWeb ? null : await getTemporaryDirectory();
  await Hive.initFlutter(appDirectory?.path).then(
    (_) async {
      await Future.wait([Hive.openBox<Object?>('app_data')])
          .then((_) => logger.debugLog('Hive successfully setup', level: 800))
          .catchError(
            (Object? error, StackTrace stackTrace) => logger.logError(
              error,
              message: 'Hive boxes opening Failure',
              stackTrace: stackTrace,
            ),
          );
    },
  ).catchError(
    (Object? error, StackTrace stackTrace) {
      logger.logError(
        error,
        message: 'Hive setup Failure',
        stackTrace: stackTrace,
      );
    },
  );

  /* Configure BLoC setup */
  // Initialize storage interface
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  // Observe state changes
  Bloc.observer = const CustomBlocObserver();

  final interceptedClient = InterceptedClient.build(
    interceptors: [NetworkLoggingInterceptorUtil()],
    requestTimeout: const Duration(seconds: 30),
  );

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => CustomRouter()),
        RepositoryProvider(
          create: (_) => HealthMetricsService(client: interceptedClient),
        ),
        RepositoryProvider(
          create: (_) => MotivationalService(client: interceptedClient),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: context.watch<CustomRouter>().routerConfig,
      debugShowCheckedModeBanner: false,
      title: 'Journal + Health App',
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
