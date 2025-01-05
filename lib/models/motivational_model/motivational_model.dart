import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sundial_wellness_tracker/models/base_model/base_model.dart';

part 'motivational_model.freezed.dart';
part 'motivational_model.g.dart';

/// This is the model for motivational messages
@freezed
final class MotivationalModel extends BaseModel with _$MotivationalModel {
  /// Factory constructor for [MotivationalModel].
  ///
  /// Provide a required motivational [message]
  /// and an optional [author] of the message
  @JsonSerializable(explicitToJson: true)
  const factory MotivationalModel({
    required String message,
    @Default('Unknown') String author,
  }) = _MotivationModel;

  /// Private constructor for ``[MotivationalModel]`` model
  /// Facilitates creation of custom methods for custom functionality
  const MotivationalModel._();

  /// Factory constructor converting json to ``[MotivationalModel]`` object
  factory MotivationalModel.fromJson(Map<String, Object?> json) =>
      _$MotivationalModelFromJson(json);

  @override
  String toString() => '$author once said `$message`';
}
