part of 'health_metrics_cubit.dart';

@immutable
abstract class HealthMetricsState with EquatableMixin {
  const HealthMetricsState();

  @override
  List<Object?> get props => [];
}

final class HealthMetricsInitial extends HealthMetricsState {
  const HealthMetricsInitial();
}

@freezed
sealed class HealthMetricsStepsCalculationState extends HealthMetricsState
    with _$HealthMetricsStepsCalculationState {
  const factory HealthMetricsStepsCalculationState.loading() =
      HealthMetricsStepsCalculationInProgress;
  const factory HealthMetricsStepsCalculationState.success({
    required int steps,
  }) = HealthMetricsStepsCalculationDone;
  const factory HealthMetricsStepsCalculationState.failure(String exception) =
      HealthMetricsStepsCalculationFailure;

  const HealthMetricsStepsCalculationState._();
}
