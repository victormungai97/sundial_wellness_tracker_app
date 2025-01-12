import 'package:hive/hive.dart';

part 'enums.g.dart';

/// Constants representing possible user temperaments
@HiveType(typeId: 222, adapterName: 'MoodAdapter')
enum Mood {
  @HiveField(0)
  fantastic,
  @HiveField(1)
  great,
  @HiveField(2)
  happy,
  @HiveField(3)
  relieved,
  @HiveField(4)
  okay,
  @HiveField(5)
  sad,
  @HiveField(6)
  anxious,
  @HiveField(7)
  angry,
  @HiveField(8)
  depressed,
}
