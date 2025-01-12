// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoodAdapter extends TypeAdapter<Mood> {
  @override
  final int typeId = 222;

  @override
  Mood read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Mood.fantastic;
      case 1:
        return Mood.great;
      case 2:
        return Mood.happy;
      case 3:
        return Mood.relieved;
      case 4:
        return Mood.okay;
      case 5:
        return Mood.sad;
      case 6:
        return Mood.anxious;
      case 7:
        return Mood.angry;
      case 8:
        return Mood.depressed;
      default:
        return Mood.fantastic;
    }
  }

  @override
  void write(BinaryWriter writer, Mood obj) {
    switch (obj) {
      case Mood.fantastic:
        writer.writeByte(0);
        break;
      case Mood.great:
        writer.writeByte(1);
        break;
      case Mood.happy:
        writer.writeByte(2);
        break;
      case Mood.relieved:
        writer.writeByte(3);
        break;
      case Mood.okay:
        writer.writeByte(4);
        break;
      case Mood.sad:
        writer.writeByte(5);
        break;
      case Mood.anxious:
        writer.writeByte(6);
        break;
      case Mood.angry:
        writer.writeByte(7);
        break;
      case Mood.depressed:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
