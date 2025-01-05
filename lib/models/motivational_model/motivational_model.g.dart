// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motivational_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MotivationModelImpl _$$MotivationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MotivationModelImpl(
      message: json['message'] as String,
      author: json['author'] as String? ?? 'Unknown',
    );

Map<String, dynamic> _$$MotivationModelImplToJson(
        _$MotivationModelImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'author': instance.author,
    };
