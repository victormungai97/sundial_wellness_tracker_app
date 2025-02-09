import 'dart:async';

import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:sundial_wellness_tracker/utils/logging_utils.dart';
import 'package:uuid/uuid.dart';

part 'uuid_model.g.dart';

/// Class building upon [UuidValue] to
/// facilitate persistent local storage of UUIDs using <code>Hive</code>
@immutable
@HiveType(typeId: 221, adapterName: 'UuidModelAdapter')
final class UuidModel extends UuidValue {
  /// Constructor of [UuidModel]
  UuidModel([this.uuidValue = '']) : super.raw(uuidValue.toLowerCase());

  /// Factory constructor of [UuidModel]
  /// that validates a provided [uuid]
  /// to ensure it is of valid format
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
      return UuidModel();
    }
  }

  @HiveField(0)
  final String uuidValue;

  UuidModel copyWith({String? uuidValue}) {
    return UuidModel.tryParse(uuidValue ?? this.uuidValue);
  }

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
