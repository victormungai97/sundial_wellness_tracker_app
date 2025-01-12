// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JournalEntryAdapter extends TypeAdapter<JournalEntryModel> {
  @override
  final int typeId = 223;

  @override
  JournalEntryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JournalEntryModel(
      id: fields[0] as UuidModel,
      content: fields[1] as String,
      mood: fields[2] as Mood?,
      createdAt: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, JournalEntryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.mood)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JournalEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JournalEntryModelImpl _$$JournalEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JournalEntryModelImpl(
      id: ModelUtils.uuidFromJson(json['id'] as String),
      content: json['content'] as String? ?? '',
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
