import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

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

  @override
  List<Object?> get props => [_dateFormat, dateTimeFromJson, dateTimeToJson];
}
