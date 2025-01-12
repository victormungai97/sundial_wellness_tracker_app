// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uuid_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UuidModelAdapter extends TypeAdapter<UuidModel> {
  @override
  final int typeId = 221;

  @override
  UuidModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UuidModel(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UuidModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.uuidValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UuidModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
