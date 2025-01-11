import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sundial_wellness_tracker/constants/enums.dart';
import 'package:sundial_wellness_tracker/models/base_model/base_model.dart';
import 'package:sundial_wellness_tracker/models/uuid_model/uuid_model.dart';
import 'package:sundial_wellness_tracker/utils/model_utils.dart';

part 'journal_entry_model.freezed.dart';
part 'journal_entry_model.g.dart';

@freezed
class JournalEntryModel extends BaseModel with _$JournalEntryModel {
  @JsonSerializable(explicitToJson: true)
  const factory JournalEntryModel({
    @JsonKey(
      fromJson: ModelUtils.uuidFromJson,
      toJson: ModelUtils.uuidToJson,
    )
    required UuidModel id,
    required String content,
    @JsonKey(
      fromJson: ModelUtils.moodFromJson,
      toJson: ModelUtils.moodToJson,
    )
    // @Default(Mood.okay)
    Mood? mood,
    @JsonKey(
      fromJson: ModelUtils.dateTimeFromJson,
      toJson: ModelUtils.dateTimeToJson,
    )
    DateTime? createdAt,
  }) = _JournalEntryModel;
}
