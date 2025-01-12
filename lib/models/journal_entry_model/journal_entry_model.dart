import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:sundial_wellness_tracker/constants/enums.dart';
import 'package:sundial_wellness_tracker/models/base_model/base_model.dart';
import 'package:sundial_wellness_tracker/models/uuid_model/uuid_model.dart';
import 'package:sundial_wellness_tracker/utils/model_utils.dart';

part 'journal_entry_model.freezed.dart';
part 'journal_entry_model.g.dart';

@freezed
// Annotate classes with [HiveType] to generate a `TypeAdapter`
@HiveType(typeId: 223, adapterName: 'JournalEntryAdapter')
class JournalEntryModel extends BaseModel with _$JournalEntryModel {
  @JsonSerializable(explicitToJson: true)
  const factory JournalEntryModel({
    @HiveField(0)
    @JsonKey(
      fromJson: ModelUtils.uuidFromJson,
      toJson: ModelUtils.uuidToJson,
    )
    required UuidModel id,
    @HiveField(1) @Default('') String content,
    @HiveField(2)
    @JsonKey(
      fromJson: ModelUtils.moodFromJson,
      toJson: ModelUtils.moodToJson,
    )
    Mood? mood,
    @HiveField(3)
    @JsonKey(
      fromJson: ModelUtils.dateTimeFromJson,
      toJson: ModelUtils.dateTimeToJson,
    )
    DateTime? createdAt,
  }) = _JournalEntryModel;

  const JournalEntryModel._();

  factory JournalEntryModel.fromJson(Map<String, Object?> json) =>
      _$JournalEntryModelFromJson(json);
}
