/// Extension to ``[DateTime]`` class to provide miscellaneous functionalities
extension DateTimeExtension on DateTime {
  /// Compare two datetimes and confirm their dates and times match
  bool isSameDay(DateTime other) => isSameDate(other) && isSameTime(other);

  /// Compare two datetimes and confirm their dates match
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Compare two datetimes and confirm their time match
  bool isSameTime(DateTime other) {
    return hour == other.hour &&
        minute == other.minute &&
        second == other.second;
  }
}
