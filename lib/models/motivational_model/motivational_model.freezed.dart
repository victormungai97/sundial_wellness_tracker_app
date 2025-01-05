// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'motivational_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MotivationalModel _$MotivationalModelFromJson(Map<String, dynamic> json) {
  return _MotivationModel.fromJson(json);
}

/// @nodoc
mixin _$MotivationalModel {
  String get message => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;

  /// Serializes this MotivationalModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MotivationalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MotivationalModelCopyWith<MotivationalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotivationalModelCopyWith<$Res> {
  factory $MotivationalModelCopyWith(
          MotivationalModel value, $Res Function(MotivationalModel) then) =
      _$MotivationalModelCopyWithImpl<$Res, MotivationalModel>;
  @useResult
  $Res call({String message, String author});
}

/// @nodoc
class _$MotivationalModelCopyWithImpl<$Res, $Val extends MotivationalModel>
    implements $MotivationalModelCopyWith<$Res> {
  _$MotivationalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MotivationalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? author = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MotivationModelImplCopyWith<$Res>
    implements $MotivationalModelCopyWith<$Res> {
  factory _$$MotivationModelImplCopyWith(_$MotivationModelImpl value,
          $Res Function(_$MotivationModelImpl) then) =
      __$$MotivationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String author});
}

/// @nodoc
class __$$MotivationModelImplCopyWithImpl<$Res>
    extends _$MotivationalModelCopyWithImpl<$Res, _$MotivationModelImpl>
    implements _$$MotivationModelImplCopyWith<$Res> {
  __$$MotivationModelImplCopyWithImpl(
      _$MotivationModelImpl _value, $Res Function(_$MotivationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MotivationalModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? author = null,
  }) {
    return _then(_$MotivationModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MotivationModelImpl extends _MotivationModel {
  const _$MotivationModelImpl({required this.message, this.author = 'Unknown'})
      : super._();

  factory _$MotivationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MotivationModelImplFromJson(json);

  @override
  final String message;
  @override
  @JsonKey()
  final String author;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MotivationModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.author, author) || other.author == author));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, author);

  /// Create a copy of MotivationalModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MotivationModelImplCopyWith<_$MotivationModelImpl> get copyWith =>
      __$$MotivationModelImplCopyWithImpl<_$MotivationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MotivationModelImplToJson(
      this,
    );
  }
}

abstract class _MotivationModel extends MotivationalModel {
  const factory _MotivationModel(
      {required final String message,
      final String author}) = _$MotivationModelImpl;
  const _MotivationModel._() : super._();

  factory _MotivationModel.fromJson(Map<String, dynamic> json) =
      _$MotivationModelImpl.fromJson;

  @override
  String get message;
  @override
  String get author;

  /// Create a copy of MotivationalModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MotivationModelImplCopyWith<_$MotivationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
