import 'package:meta/meta.dart';

/// Underlying data structure for all models
@immutable
abstract class BaseModel {
  const BaseModel();

  factory BaseModel.fromJson(Map<String, Object?> _) =>
      throw UnimplementedError();
}
