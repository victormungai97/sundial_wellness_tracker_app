// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_metrics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthMetricsModelImpl _$$HealthMetricsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HealthMetricsModelImpl(
      steps: (json['steps'] as num).toInt(),
      heartRate: (json['heartRate'] as num).toInt(),
      updatedAt: ModelUtils.dateTimeFromJson(json['lastUpdated'] as String?),
    );

Map<String, dynamic> _$$HealthMetricsModelImplToJson(
        _$HealthMetricsModelImpl instance) =>
    <String, dynamic>{
      'steps': instance.steps,
      'heartRate': instance.heartRate,
      'lastUpdated': ModelUtils.dateTimeToJson(instance.updatedAt),
    };
