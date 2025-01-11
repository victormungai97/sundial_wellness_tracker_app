import 'dart:async';

import 'package:meta/meta.dart';
import 'package:sundial_wellness_tracker/utils/logging_utils.dart';
import 'package:uuid/uuid.dart';

/// Class building upon [UuidValue] to
/// facilitate persistent local storage of UUIDs using <code>Hive</code>
@immutable
final class UuidModel extends UuidValue {
  UuidModel(this.uuidValue) : super.raw(uuidValue.toLowerCase());

  factory UuidModel.tryParse(String uuid) {
    try {
      return UuidModel('${UuidValue.withValidation(uuid)}');
    } on FormatException catch (error, stackTrace) {
      Timer.run(
        () async {
          await LoggingUtils().logError(
            error,
            stackTrace: stackTrace,
            message: 'UUID Validation Error',
          );
        },
      );
      return UuidModel('');
    }
  }

  factory UuidModel.fromJson(Map<String, Object?> json) {
    return UuidModel((json['uuid'] ?? '') as String);
  }

  final String uuidValue;

  UuidModel copyWith({String? uuidValue}) {
    return UuidModel.tryParse(uuidValue ?? this.uuidValue);
  }

  Map<String, Object?> toJson() => {'uuid': uuidValue};

  @override
  String toString() => 'UuidModel(uuidValue: $uuidValue)';

  @override
  bool operator ==(Object other) {
    return other is UuidModel &&
        other.runtimeType == runtimeType &&
        other.uuidValue == uuidValue;
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuidValue);
}
