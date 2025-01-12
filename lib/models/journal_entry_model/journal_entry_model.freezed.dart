// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JournalEntryModel _$JournalEntryModelFromJson(Map<String, dynamic> json) {
  return _JournalEntryModel.fromJson(json);
}

/// @nodoc
mixin _$JournalEntryModel {
  @HiveField(0)
  @JsonKey(fromJson: ModelUtils.uuidFromJson, toJson: ModelUtils.uuidToJson)
  UuidModel get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get content => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(fromJson: ModelUtils.moodFromJson, toJson: ModelUtils.moodToJson)
  Mood? get mood => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(
      fromJson: ModelUtils.dateTimeFromJson, toJson: ModelUtils.dateTimeToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this JournalEntryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JournalEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JournalEntryModelCopyWith<JournalEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalEntryModelCopyWith<$Res> {
  factory $JournalEntryModelCopyWith(
          JournalEntryModel value, $Res Function(JournalEntryModel) then) =
      _$JournalEntryModelCopyWithImpl<$Res, JournalEntryModel>;
  @useResult
  $Res call(
      {@HiveField(0)
      @JsonKey(fromJson: ModelUtils.uuidFromJson, toJson: ModelUtils.uuidToJson)
      UuidModel id,
      @HiveField(1) String content,
      @HiveField(2)
      @JsonKey(fromJson: ModelUtils.moodFromJson, toJson: ModelUtils.moodToJson)
      Mood? mood,
      @HiveField(3)
      @JsonKey(
          fromJson: ModelUtils.dateTimeFromJson,
          toJson: ModelUtils.dateTimeToJson)
      DateTime? createdAt});
}

/// @nodoc
class _$JournalEntryModelCopyWithImpl<$Res, $Val extends JournalEntryModel>
    implements $JournalEntryModelCopyWith<$Res> {
  _$JournalEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? mood = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidModel,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Mood?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JournalEntryModelImplCopyWith<$Res>
    implements $JournalEntryModelCopyWith<$Res> {
  factory _$$JournalEntryModelImplCopyWith(_$JournalEntryModelImpl value,
          $Res Function(_$JournalEntryModelImpl) then) =
      __$$JournalEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0)
      @JsonKey(fromJson: ModelUtils.uuidFromJson, toJson: ModelUtils.uuidToJson)
      UuidModel id,
      @HiveField(1) String content,
      @HiveField(2)
      @JsonKey(fromJson: ModelUtils.moodFromJson, toJson: ModelUtils.moodToJson)
      Mood? mood,
      @HiveField(3)
      @JsonKey(
          fromJson: ModelUtils.dateTimeFromJson,
          toJson: ModelUtils.dateTimeToJson)
      DateTime? createdAt});
}

/// @nodoc
class __$$JournalEntryModelImplCopyWithImpl<$Res>
    extends _$JournalEntryModelCopyWithImpl<$Res, _$JournalEntryModelImpl>
    implements _$$JournalEntryModelImplCopyWith<$Res> {
  __$$JournalEntryModelImplCopyWithImpl(_$JournalEntryModelImpl _value,
      $Res Function(_$JournalEntryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? mood = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$JournalEntryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UuidModel,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Mood?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$JournalEntryModelImpl extends _JournalEntryModel {
  const _$JournalEntryModelImpl(
      {@HiveField(0)
      @JsonKey(fromJson: ModelUtils.uuidFromJson, toJson: ModelUtils.uuidToJson)
      required this.id,
      @HiveField(1) this.content = '',
      @HiveField(2)
      @JsonKey(fromJson: ModelUtils.moodFromJson, toJson: ModelUtils.moodToJson)
      this.mood,
      @HiveField(3)
      @JsonKey(
          fromJson: ModelUtils.dateTimeFromJson,
          toJson: ModelUtils.dateTimeToJson)
      this.createdAt})
      : super._();

  factory _$JournalEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$JournalEntryModelImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(fromJson: ModelUtils.uuidFromJson, toJson: ModelUtils.uuidToJson)
  final UuidModel id;
  @override
  @JsonKey()
  @HiveField(1)
  final String content;
  @override
  @HiveField(2)
  @JsonKey(fromJson: ModelUtils.moodFromJson, toJson: ModelUtils.moodToJson)
  final Mood? mood;
  @override
  @HiveField(3)
  @JsonKey(
      fromJson: ModelUtils.dateTimeFromJson, toJson: ModelUtils.dateTimeToJson)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'JournalEntryModel(id: $id, content: $content, mood: $mood, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JournalEntryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, content, mood, createdAt);

  /// Create a copy of JournalEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalEntryModelImplCopyWith<_$JournalEntryModelImpl> get copyWith =>
      __$$JournalEntryModelImplCopyWithImpl<_$JournalEntryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JournalEntryModelImplToJson(
      this,
    );
  }
}

abstract class _JournalEntryModel extends JournalEntryModel {
  const factory _JournalEntryModel(
      {@HiveField(0)
      @JsonKey(fromJson: ModelUtils.uuidFromJson, toJson: ModelUtils.uuidToJson)
      required final UuidModel id,
      @HiveField(1) final String content,
      @HiveField(2)
      @JsonKey(fromJson: ModelUtils.moodFromJson, toJson: ModelUtils.moodToJson)
      final Mood? mood,
      @HiveField(3)
      @JsonKey(
          fromJson: ModelUtils.dateTimeFromJson,
          toJson: ModelUtils.dateTimeToJson)
      final DateTime? createdAt}) = _$JournalEntryModelImpl;
  const _JournalEntryModel._() : super._();

  factory _JournalEntryModel.fromJson(Map<String, dynamic> json) =
      _$JournalEntryModelImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(fromJson: ModelUtils.uuidFromJson, toJson: ModelUtils.uuidToJson)
  UuidModel get id;
  @override
  @HiveField(1)
  String get content;
  @override
  @HiveField(2)
  @JsonKey(fromJson: ModelUtils.moodFromJson, toJson: ModelUtils.moodToJson)
  Mood? get mood;
  @override
  @HiveField(3)
  @JsonKey(
      fromJson: ModelUtils.dateTimeFromJson, toJson: ModelUtils.dateTimeToJson)
  DateTime? get createdAt;

  /// Create a copy of JournalEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalEntryModelImplCopyWith<_$JournalEntryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
