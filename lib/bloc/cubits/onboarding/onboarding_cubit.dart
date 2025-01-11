import 'package:bloc/bloc.dart';
import 'package:sundial_wellness_tracker/services/storage/storage.dart';

/// This [Cubit] keeps track of and
/// checks whether a user has clicked onboarding screen
class OnboardingCubit extends Cubit<bool> {
  /// Factory constructor for [OnboardingCubit]
  /// to implement a class that is a singleton
  factory OnboardingCubit(OnboardingService onboardingService) {
    return _instance ??= OnboardingCubit._(onboardingService);
  }

  /// Private constructor of [OnboardingCubit]
  OnboardingCubit._(this._onboardingService)
      : super(_onboardingService.get('onboarding', defValue: false)!);

  /// One and only instance of [OnboardingCubit]
  static OnboardingCubit? _instance;

  /// Mark the onboarding screen as having been viewed
  Future<void> onBoardingDone() async {
    await _onboardingService.put('onboarding', true).then((_) => emit(true));
  }

  /// Check whether the onboarding screen has been viewed
  bool get onboardingState => _onboardingService.get(
        'onboarding',
        defValue: false,
      )!;

  final OnboardingService _onboardingService;
}
