import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sundial_wellness_tracker/extensions/extensions.dart';
import 'package:sundial_wellness_tracker/services/networking/networking.dart';
import 'package:sundial_wellness_tracker/utils/logging_utils.dart';

part 'health_metrics_cubit.freezed.dart';
part 'health_metrics_state.dart';

/// This [Cubit] facilitates retrieval of health metrics
class HealthMetricsCubit extends Cubit<HealthMetricsState> {
  /// Constructor for [HealthMetricsCubit]
  HealthMetricsCubit(this._healthMetricsService)
      : super(const HealthMetricsInitial());

  final HealthMetricsService _healthMetricsService;
  static final LoggingUtils _logger = LoggingUtils();

  /// This method compute the number of steps a user has taken
  Future<void> calculateSteps() async {
    emit(const HealthMetricsStepsCalculationInProgress());
    try {
      final (:data, :error) = await _healthMetricsService.computeTotalSteps();
      if (error.exists) {
        emit(HealthMetricsStepsCalculationState.failure(error!));
        return;
      }
      if (data == null) {
        emit(
          const HealthMetricsStepsCalculationFailure('Steps were not provided'),
        );
        return;
      }
      emit(HealthMetricsStepsCalculationState.success(steps: data));
    } on Exception catch (error, stackTrace) {
      await _logger.logError(
        error,
        message:
            '`health_metrics_cubit.HealthMetricsCubit.calculateSteps` Error',
        stackTrace: stackTrace,
      );
      emit(
        const HealthMetricsStepsCalculationState.failure(
          'Error occurred while calculating steps taken',
        ),
      );
    }
  }

  /// Return [HealthMetricsCubit] to initial state
  void reset() => emit(const HealthMetricsInitial());
}
