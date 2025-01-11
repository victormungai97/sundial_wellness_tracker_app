// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JournalEntryModelImpl _$$JournalEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JournalEntryModelImpl(
      id: ModelUtils.uuidFromJson(json['id'] as String),
      content: json['content'] as String,
      mood: ModelUtils.moodFromJson(json['mood'] as String?),
      createdAt: ModelUtils.dateTimeFromJson(json['createdAt'] as String?),
    );

Map<String, dynamic> _$$JournalEntryModelImplToJson(
        _$JournalEntryModelImpl instance) =>
    <String, dynamic>{
      'id': ModelUtils.uuidToJson(instance.id),
      'content': instance.content,
      'mood': ModelUtils.moodToJson(instance.mood),
      'createdAt': ModelUtils.dateTimeToJson(instance.createdAt),
    };
