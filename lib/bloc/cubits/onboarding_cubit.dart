import 'package:hydrated_bloc/hydrated_bloc.dart';

/// This [Cubit] keeps track of and
/// checks whether a user has clicked onboarding screen
class OnboardingCubit extends Cubit<bool> with HydratedMixin {
  /// Constructor for [OnboardingCubit]
  OnboardingCubit() : super(false) {
    hydrate();
  }

  void onBoardingDone() => emit(true);

  bool get onboardingState => state;

  @override
  bool fromJson(Map<String, dynamic> json) => json['onboarding'] as bool;

  @override
  Map<String, bool> toJson(bool state) => {'onboarding': state};
}
