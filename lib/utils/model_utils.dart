import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:sundial_wellness_tracker/constants/enums.dart';
import 'package:sundial_wellness_tracker/models/uuid_model/uuid_model.dart';

/// This class provides convenience methods used in models
final class ModelUtils with EquatableMixin {
  static final _dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');

  static DateTime? dateTimeFromJson(String? dateTime) {
    if (dateTime == null ||
        dateTime.isEmpty ||
        num.tryParse(dateTime[0]) == null) {
      return null;
    }
    return _dateFormat.parse(dateTime, true).toLocal();
  }

  static String? dateTimeToJson(DateTime? dateTime) {
    if (dateTime == null) return null;
    return _dateFormat.format(dateTime.toUtc());
  }

  static UuidModel uuidFromJson(String uuid) => UuidModel.tryParse(uuid);

  static String uuidToJson(UuidModel uuid) {
    return uuid.toFormattedString(validate: true);
  }

  static Mood? moodFromJson(String? mood) {
    if (mood == null || mood.isEmpty) return null;
    return Mood.values.where((e) => e.name == mood).firstOrNull;
  }

  static String? moodToJson(Mood? mood) => mood?.name;

  @override
  List<Object?> get props => [
        _dateFormat,
        dateTimeFromJson,
        dateTimeToJson,
        moodFromJson,
        moodToJson,
      ];
}
