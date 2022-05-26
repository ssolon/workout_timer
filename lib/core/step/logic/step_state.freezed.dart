// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'step_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RoutineStepState {
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  BeginAction get beginAction => throw _privateConstructorUsedError;
  StepTimer get timer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoutineStepStateCopyWith<RoutineStepState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutineStepStateCopyWith<$Res> {
  factory $RoutineStepStateCopyWith(
          RoutineStepState value, $Res Function(RoutineStepState) then) =
      _$RoutineStepStateCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String? description,
      BeginAction beginAction,
      StepTimer timer});
}

/// @nodoc
class _$RoutineStepStateCopyWithImpl<$Res>
    implements $RoutineStepStateCopyWith<$Res> {
  _$RoutineStepStateCopyWithImpl(this._value, this._then);

  final RoutineStepState _value;
  // ignore: unused_field
  final $Res Function(RoutineStepState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? beginAction = freezed,
    Object? timer = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      beginAction: beginAction == freezed
          ? _value.beginAction
          : beginAction // ignore: cast_nullable_to_non_nullable
              as BeginAction,
      timer: timer == freezed
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as StepTimer,
    ));
  }
}

/// @nodoc
abstract class _$$_StepStateCopyWith<$Res>
    implements $RoutineStepStateCopyWith<$Res> {
  factory _$$_StepStateCopyWith(
          _$_StepState value, $Res Function(_$_StepState) then) =
      __$$_StepStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String? description,
      BeginAction beginAction,
      StepTimer timer});
}

/// @nodoc
class __$$_StepStateCopyWithImpl<$Res>
    extends _$RoutineStepStateCopyWithImpl<$Res>
    implements _$$_StepStateCopyWith<$Res> {
  __$$_StepStateCopyWithImpl(
      _$_StepState _value, $Res Function(_$_StepState) _then)
      : super(_value, (v) => _then(v as _$_StepState));

  @override
  _$_StepState get _value => super._value as _$_StepState;

  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? beginAction = freezed,
    Object? timer = freezed,
  }) {
    return _then(_$_StepState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      beginAction: beginAction == freezed
          ? _value.beginAction
          : beginAction // ignore: cast_nullable_to_non_nullable
              as BeginAction,
      timer: timer == freezed
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as StepTimer,
    ));
  }
}

/// @nodoc

class _$_StepState implements _StepState {
  const _$_StepState(
      {required this.name,
      this.description,
      this.beginAction = BeginAction.waitForStartCommand,
      this.timer = StepTimer.countUp});

  @override
  final String name;
  @override
  final String? description;
  @override
  @JsonKey()
  final BeginAction beginAction;
  @override
  @JsonKey()
  final StepTimer timer;

  @override
  String toString() {
    return 'RoutineStepState(name: $name, description: $description, beginAction: $beginAction, timer: $timer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StepState &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.beginAction, beginAction) &&
            const DeepCollectionEquality().equals(other.timer, timer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(beginAction),
      const DeepCollectionEquality().hash(timer));

  @JsonKey(ignore: true)
  @override
  _$$_StepStateCopyWith<_$_StepState> get copyWith =>
      __$$_StepStateCopyWithImpl<_$_StepState>(this, _$identity);
}

abstract class _StepState implements RoutineStepState {
  const factory _StepState(
      {required final String name,
      final String? description,
      final BeginAction beginAction,
      final StepTimer timer}) = _$_StepState;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  BeginAction get beginAction => throw _privateConstructorUsedError;
  @override
  StepTimer get timer => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StepStateCopyWith<_$_StepState> get copyWith =>
      throw _privateConstructorUsedError;
}
