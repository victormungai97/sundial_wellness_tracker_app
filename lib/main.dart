import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http_interceptor/http_interceptor.dart';
// import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sundial_wellness_tracker/bloc/cubits/cubits.dart';
import 'package:sundial_wellness_tracker/bloc/observer.dart';
import 'package:sundial_wellness_tracker/firebase_options.dart';
import 'package:sundial_wellness_tracker/navigation/navigation.dart';
import 'package:sundial_wellness_tracker/services/networking/networking.dart';
import 'package:sundial_wellness_tracker/services/storage/storage.dart';
import 'package:sundial_wellness_tracker/utils/logging_utils.dart';
import 'package:sundial_wellness_tracker/utils/network_interceptor_utils.dart';
import 'package:sundial_wellness_tracker/widgets/stateful_wrapper.dart';

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
      await Future.wait([Hive.openBox<bool>('onboarding_box')])
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
  // Observe state changes
  Bloc.observer = const CustomBlocObserver();

  runApp(
    MyApp(
      client: InterceptedClient.build(
        interceptors: [NetworkLoggingInterceptorUtil()],
        requestTimeout: const Duration(seconds: 30),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.client});

  final Client? client;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onDispose: Hive.close,
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (_) => HealthMetricsService(client: client),
          ),
          RepositoryProvider(
            create: (_) => MotivationalService(client: client),
          ),
          RepositoryProvider(
            create: (_) {
              return OnboardingService(box: Hive.box<bool>('onboarding_box'));
            },
          ),
        ],
        child: const _App(key: ValueKey('App')),
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = CustomRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MotivationCubit(
            context.read<MotivationalService>(),
          ),
        ),
        BlocProvider(
          create: (context) => HealthMetricsCubit(
            context.read<HealthMetricsService>(),
          ),
        ),
        BlocProvider<OnboardingCubit>(
          create: (context) {
            final onboardingService = context.read<OnboardingService>();
            Timer.run(
              () async {
                if (onboardingService.get('onboarding') == null) {
                  await onboardingService.put('onboarding', false);
                }
              },
            );
            return OnboardingCubit(onboardingService);
          },
        ),
        BlocProvider<JournalEntryCubit>(create: (_) => JournalEntryCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: router.routerConfig,
        debugShowCheckedModeBanner: false,
        title: 'Sundial Wellness Tracker',
        theme: ThemeData(primarySwatch: Colors.purple),
      ),
    );
  }
}
