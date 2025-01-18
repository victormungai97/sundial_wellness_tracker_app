// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journal_entry_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JournalEntryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(JournalEntryModel journalEntry) entryAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(JournalEntryModel journalEntry)? entryAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(JournalEntryModel journalEntry)? entryAdded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_EntryAdded value) entryAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_EntryAdded value)? entryAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_EntryAdded value)? entryAdded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalEntryEventCopyWith<$Res> {
  factory $JournalEntryEventCopyWith(
          JournalEntryEvent value, $Res Function(JournalEntryEvent) then) =
      _$JournalEntryEventCopyWithImpl<$Res, JournalEntryEvent>;
}

/// @nodoc
class _$JournalEntryEventCopyWithImpl<$Res, $Val extends JournalEntryEvent>
    implements $JournalEntryEventCopyWith<$Res> {
  _$JournalEntryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalEntryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$JournalEntryEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalEntryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'JournalEntryEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(JournalEntryModel journalEntry) entryAdded,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(JournalEntryModel journalEntry)? entryAdded,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(JournalEntryModel journalEntry)? entryAdded,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_EntryAdded value) entryAdded,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_EntryAdded value)? entryAdded,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_EntryAdded value)? entryAdded,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements JournalEntryEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$EntryAddedImplCopyWith<$Res> {
  factory _$$EntryAddedImplCopyWith(
          _$EntryAddedImpl value, $Res Function(_$EntryAddedImpl) then) =
      __$$EntryAddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({JournalEntryModel journalEntry});

  $JournalEntryModelCopyWith<$Res> get journalEntry;
}

/// @nodoc
class __$$EntryAddedImplCopyWithImpl<$Res>
    extends _$JournalEntryEventCopyWithImpl<$Res, _$EntryAddedImpl>
    implements _$$EntryAddedImplCopyWith<$Res> {
  __$$EntryAddedImplCopyWithImpl(
      _$EntryAddedImpl _value, $Res Function(_$EntryAddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? journalEntry = null,
  }) {
    return _then(_$EntryAddedImpl(
      null == journalEntry
          ? _value.journalEntry
          : journalEntry // ignore: cast_nullable_to_non_nullable
              as JournalEntryModel,
    ));
  }

  /// Create a copy of JournalEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $JournalEntryModelCopyWith<$Res> get journalEntry {
    return $JournalEntryModelCopyWith<$Res>(_value.journalEntry, (value) {
      return _then(_value.copyWith(journalEntry: value));
    });
  }
}

/// @nodoc

class _$EntryAddedImpl implements _EntryAdded {
  const _$EntryAddedImpl(this.journalEntry);

  @override
  final JournalEntryModel journalEntry;

  @override
  String toString() {
    return 'JournalEntryEvent.entryAdded(journalEntry: $journalEntry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntryAddedImpl &&
            (identical(other.journalEntry, journalEntry) ||
                other.journalEntry == journalEntry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, journalEntry);

  /// Create a copy of JournalEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntryAddedImplCopyWith<_$EntryAddedImpl> get copyWith =>
      __$$EntryAddedImplCopyWithImpl<_$EntryAddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(JournalEntryModel journalEntry) entryAdded,
  }) {
    return entryAdded(journalEntry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(JournalEntryModel journalEntry)? entryAdded,
  }) {
    return entryAdded?.call(journalEntry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(JournalEntryModel journalEntry)? entryAdded,
    required TResult orElse(),
  }) {
    if (entryAdded != null) {
      return entryAdded(journalEntry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_EntryAdded value) entryAdded,
  }) {
    return entryAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_EntryAdded value)? entryAdded,
  }) {
    return entryAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_EntryAdded value)? entryAdded,
    required TResult orElse(),
  }) {
    if (entryAdded != null) {
      return entryAdded(this);
    }
    return orElse();
  }
}

abstract class _EntryAdded implements JournalEntryEvent {
  const factory _EntryAdded(final JournalEntryModel journalEntry) =
      _$EntryAddedImpl;

  JournalEntryModel get journalEntry;

  /// Create a copy of JournalEntryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntryAddedImplCopyWith<_$EntryAddedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$JournalEntryRecordAddedState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function() success,
    required TResult Function(String exception) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function()? success,
    TResult? Function(String exception)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function()? success,
    TResult Function(String exception)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JournalEntryRecordAddedInProgress value) loaded,
    required TResult Function(JournalEntryRecordAddedDone value) success,
    required TResult Function(JournalEntryRecordAddedFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JournalEntryRecordAddedInProgress value)? loaded,
    TResult? Function(JournalEntryRecordAddedDone value)? success,
    TResult? Function(JournalEntryRecordAddedFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JournalEntryRecordAddedInProgress value)? loaded,
    TResult Function(JournalEntryRecordAddedDone value)? success,
    TResult Function(JournalEntryRecordAddedFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalEntryRecordAddedStateCopyWith<$Res> {
  factory $JournalEntryRecordAddedStateCopyWith(
          JournalEntryRecordAddedState value,
          $Res Function(JournalEntryRecordAddedState) then) =
      _$JournalEntryRecordAddedStateCopyWithImpl<$Res,
          JournalEntryRecordAddedState>;
}

/// @nodoc
class _$JournalEntryRecordAddedStateCopyWithImpl<$Res,
        $Val extends JournalEntryRecordAddedState>
    implements $JournalEntryRecordAddedStateCopyWith<$Res> {
  _$JournalEntryRecordAddedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JournalEntryRecordAddedState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$JournalEntryRecordAddedInProgressImplCopyWith<$Res> {
  factory _$$JournalEntryRecordAddedInProgressImplCopyWith(
          _$JournalEntryRecordAddedInProgressImpl value,
          $Res Function(_$JournalEntryRecordAddedInProgressImpl) then) =
      __$$JournalEntryRecordAddedInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JournalEntryRecordAddedInProgressImplCopyWithImpl<$Res>
    extends _$JournalEntryRecordAddedStateCopyWithImpl<$Res,
        _$JournalEntryRecordAddedInProgressImpl>
    implements _$$JournalEntryRecordAddedInProgressImplCopyWith<$Res> {
  __$$JournalEntryRecordAddedInProgressImplCopyWithImpl(
      _$JournalEntryRecordAddedInProgressImpl _value,
      $Res Function(_$JournalEntryRecordAddedInProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalEntryRecordAddedState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$JournalEntryRecordAddedInProgressImpl
    extends JournalEntryRecordAddedInProgress {
  const _$JournalEntryRecordAddedInProgressImpl() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function() success,
    required TResult Function(String exception) failure,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function()? success,
    TResult? Function(String exception)? failure,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function()? success,
    TResult Function(String exception)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JournalEntryRecordAddedInProgress value) loaded,
    required TResult Function(JournalEntryRecordAddedDone value) success,
    required TResult Function(JournalEntryRecordAddedFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JournalEntryRecordAddedInProgress value)? loaded,
    TResult? Function(JournalEntryRecordAddedDone value)? success,
    TResult? Function(JournalEntryRecordAddedFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JournalEntryRecordAddedInProgress value)? loaded,
    TResult Function(JournalEntryRecordAddedDone value)? success,
    TResult Function(JournalEntryRecordAddedFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class JournalEntryRecordAddedInProgress
    extends JournalEntryRecordAddedState {
  const factory JournalEntryRecordAddedInProgress() =
      _$JournalEntryRecordAddedInProgressImpl;
  const JournalEntryRecordAddedInProgress._() : super._();
}

/// @nodoc
abstract class _$$JournalEntryRecordAddedDoneImplCopyWith<$Res> {
  factory _$$JournalEntryRecordAddedDoneImplCopyWith(
          _$JournalEntryRecordAddedDoneImpl value,
          $Res Function(_$JournalEntryRecordAddedDoneImpl) then) =
      __$$JournalEntryRecordAddedDoneImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JournalEntryRecordAddedDoneImplCopyWithImpl<$Res>
    extends _$JournalEntryRecordAddedStateCopyWithImpl<$Res,
        _$JournalEntryRecordAddedDoneImpl>
    implements _$$JournalEntryRecordAddedDoneImplCopyWith<$Res> {
  __$$JournalEntryRecordAddedDoneImplCopyWithImpl(
      _$JournalEntryRecordAddedDoneImpl _value,
      $Res Function(_$JournalEntryRecordAddedDoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalEntryRecordAddedState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$JournalEntryRecordAddedDoneImpl extends JournalEntryRecordAddedDone {
  const _$JournalEntryRecordAddedDoneImpl() : super._();

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function() success,
    required TResult Function(String exception) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function()? success,
    TResult? Function(String exception)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function()? success,
    TResult Function(String exception)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JournalEntryRecordAddedInProgress value) loaded,
    required TResult Function(JournalEntryRecordAddedDone value) success,
    required TResult Function(JournalEntryRecordAddedFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JournalEntryRecordAddedInProgress value)? loaded,
    TResult? Function(JournalEntryRecordAddedDone value)? success,
    TResult? Function(JournalEntryRecordAddedFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JournalEntryRecordAddedInProgress value)? loaded,
    TResult Function(JournalEntryRecordAddedDone value)? success,
    TResult Function(JournalEntryRecordAddedFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class JournalEntryRecordAddedDone
    extends JournalEntryRecordAddedState {
  const factory JournalEntryRecordAddedDone() =
      _$JournalEntryRecordAddedDoneImpl;
  const JournalEntryRecordAddedDone._() : super._();
}

/// @nodoc
abstract class _$$JournalEntryRecordAddedFailureImplCopyWith<$Res> {
  factory _$$JournalEntryRecordAddedFailureImplCopyWith(
          _$JournalEntryRecordAddedFailureImpl value,
          $Res Function(_$JournalEntryRecordAddedFailureImpl) then) =
      __$$JournalEntryRecordAddedFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String exception});
}

/// @nodoc
class __$$JournalEntryRecordAddedFailureImplCopyWithImpl<$Res>
    extends _$JournalEntryRecordAddedStateCopyWithImpl<$Res,
        _$JournalEntryRecordAddedFailureImpl>
    implements _$$JournalEntryRecordAddedFailureImplCopyWith<$Res> {
  __$$JournalEntryRecordAddedFailureImplCopyWithImpl(
      _$JournalEntryRecordAddedFailureImpl _value,
      $Res Function(_$JournalEntryRecordAddedFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of JournalEntryRecordAddedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$JournalEntryRecordAddedFailureImpl(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$JournalEntryRecordAddedFailureImpl
    extends JournalEntryRecordAddedFailure {
  const _$JournalEntryRecordAddedFailureImpl(this.exception) : super._();

  @override
  final String exception;

  /// Create a copy of JournalEntryRecordAddedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JournalEntryRecordAddedFailureImplCopyWith<
          _$JournalEntryRecordAddedFailureImpl>
      get copyWith => __$$JournalEntryRecordAddedFailureImplCopyWithImpl<
          _$JournalEntryRecordAddedFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
    required TResult Function() success,
    required TResult Function(String exception) failure,
  }) {
    return failure(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
    TResult? Function()? success,
    TResult? Function(String exception)? failure,
  }) {
    return failure?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    TResult Function()? success,
    TResult Function(String exception)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(JournalEntryRecordAddedInProgress value) loaded,
    required TResult Function(JournalEntryRecordAddedDone value) success,
    required TResult Function(JournalEntryRecordAddedFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(JournalEntryRecordAddedInProgress value)? loaded,
    TResult? Function(JournalEntryRecordAddedDone value)? success,
    TResult? Function(JournalEntryRecordAddedFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(JournalEntryRecordAddedInProgress value)? loaded,
    TResult Function(JournalEntryRecordAddedDone value)? success,
    TResult Function(JournalEntryRecordAddedFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class JournalEntryRecordAddedFailure
    extends JournalEntryRecordAddedState {
  const factory JournalEntryRecordAddedFailure(final String exception) =
      _$JournalEntryRecordAddedFailureImpl;
  const JournalEntryRecordAddedFailure._() : super._();

  String get exception;

  /// Create a copy of JournalEntryRecordAddedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JournalEntryRecordAddedFailureImplCopyWith<
          _$JournalEntryRecordAddedFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
