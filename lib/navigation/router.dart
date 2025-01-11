part of 'navigation.dart';

/// Custom class for Navigation
@immutable
final class CustomRouter with EquatableMixin {
  /// Factory constructor for [CustomRouter]
  /// to implement a class that is a singleton
  factory CustomRouter() => _instance ??= CustomRouter._();

  /// Private constructor of [CustomRouter]
  CustomRouter._();

  /// One and only instance of [CustomRouter]
  static CustomRouter? _instance;

  /// Instance of `GoRouter` which facilitates navigation in this Flutter app
  /// by implementing Navigation API 2.0

  late final routerConfig = GoRouter(
    // Show debugging logs if app is in debug.
    debugLogDiagnostics: kDebugMode,
    // Set all routes to be used
    routes: <GoRoute>[
      GoRoute(
        path: Routes.root,
        builder: (context, state) {
          final onboardingCubit = context.watch<OnboardingCubit>();
          return switch (onboardingCubit.onboardingState) {
            true => const JournalPage(),
            false => const OnboardingPage(),
          };
        },
      ),
      GoRoute(
        path: Routes.onboarding,
        builder: (context, GoRouterState state) => const OnboardingPage(),
      ),
      GoRoute(
        path: Routes.journal,
        builder: (context, GoRouterState state) => const JournalPage(),
      ),
      GoRoute(
        path: Routes.dashboard,
        builder: (context, GoRouterState state) => const DashboardPage(),
      ),
    ],
    // Error handler
    errorBuilder: (error, state) => Scaffold(
      body: Center(
        child: Text(
          state.error?.message ?? 'Error occurred navigation to page',
        ),
      ),
    ),
    initialLocation: Routes.root,
    redirect: (context, state) {
      final onBoardingDone = context.read<OnboardingCubit>().onboardingState;
      const onBoardedRoutes = [Routes.journal, Routes.dashboard];
      if (!onBoardingDone && onBoardedRoutes.contains(state.fullPath)) {
        return Routes.onboarding;
      }
      if (onBoardingDone && state.fullPath == Routes.onboarding) {
        return Routes.journal;
      }
      return null;
    },
  );

  @override
  List<Object?> get props => [routerConfig];
}
