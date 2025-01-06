import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sundial_wellness_tracker/models/base_model/base_model.dart';
import 'package:sundial_wellness_tracker/utils/model_utils.dart';

part 'health_metrics_model.freezed.dart';
part 'health_metrics_model.g.dart';

@freezed
class HealthMetricsModel extends BaseModel with _$HealthMetricsModel {
  /// Factory constructor for [HealthMetricsModel].
  ///
  /// Provide required number of [steps] and [heartRate]
  /// alongside the time it was [updatedAt].
  @JsonSerializable(explicitToJson: true)
  const factory HealthMetricsModel({
    required int steps,
    required int heartRate,
    @JsonKey(
      name: 'lastUpdated',
      fromJson: ModelUtils.dateTimeFromJson,
      toJson: ModelUtils.dateTimeToJson,
    )
    DateTime? updatedAt,
  }) = _HealthMetricsModel;

  /// Private constructor for ``[HealthMetricsModel]`` model
  /// Facilitates creation of custom methods for custom functionality
  const HealthMetricsModel._();

  /// Factory constructor converting json to ``[HealthMetricsModel]`` object
  factory HealthMetricsModel.fromJson(Map<String, Object?> json) =>
      _$HealthMetricsModelFromJson(json);

  @override
  String toString() =>
      'Health Metric: {Steps: $steps, Heart Rate: $heartRate, Last Update: $updatedAt}';
}
