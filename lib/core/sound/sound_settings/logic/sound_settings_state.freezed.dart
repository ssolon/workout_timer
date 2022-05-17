// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sound_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SoundSettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            bool enabled,
            bool expanded,
            bool start,
            bool stop,
            bool reset,
            bool tick,
            SoundEvery tickEvery,
            bool beep,
            SoundEvery beepEvery)
        $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            bool enabled,
            bool expanded,
            bool start,
            bool stop,
            bool reset,
            bool tick,
            SoundEvery tickEvery,
            bool beep,
            SoundEvery beepEvery)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            bool enabled,
            bool expanded,
            bool start,
            bool stop,
            bool reset,
            bool tick,
            SoundEvery tickEvery,
            bool beep,
            SoundEvery beepEvery)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Settings value) $default, {
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(Settings value)? $default, {
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Settings value)? $default, {
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoundSettingsStateCopyWith<$Res> {
  factory $SoundSettingsStateCopyWith(
          SoundSettingsState value, $Res Function(SoundSettingsState) then) =
      _$SoundSettingsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SoundSettingsStateCopyWithImpl<$Res>
    implements $SoundSettingsStateCopyWith<$Res> {
  _$SoundSettingsStateCopyWithImpl(this._value, this._then);

  final SoundSettingsState _value;
  // ignore: unused_field
  final $Res Function(SoundSettingsState) _then;
}

/// @nodoc
abstract class _$$SettingsCopyWith<$Res> {
  factory _$$SettingsCopyWith(
          _$Settings value, $Res Function(_$Settings) then) =
      __$$SettingsCopyWithImpl<$Res>;
  $Res call(
      {bool enabled,
      bool expanded,
      bool start,
      bool stop,
      bool reset,
      bool tick,
      SoundEvery tickEvery,
      bool beep,
      SoundEvery beepEvery});
}

/// @nodoc
class __$$SettingsCopyWithImpl<$Res>
    extends _$SoundSettingsStateCopyWithImpl<$Res>
    implements _$$SettingsCopyWith<$Res> {
  __$$SettingsCopyWithImpl(_$Settings _value, $Res Function(_$Settings) _then)
      : super(_value, (v) => _then(v as _$Settings));

  @override
  _$Settings get _value => super._value as _$Settings;

  @override
  $Res call({
    Object? enabled = freezed,
    Object? expanded = freezed,
    Object? start = freezed,
    Object? stop = freezed,
    Object? reset = freezed,
    Object? tick = freezed,
    Object? tickEvery = freezed,
    Object? beep = freezed,
    Object? beepEvery = freezed,
  }) {
    return _then(_$Settings(
      enabled: enabled == freezed
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      expanded: expanded == freezed
          ? _value.expanded
          : expanded // ignore: cast_nullable_to_non_nullable
              as bool,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as bool,
      stop: stop == freezed
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as bool,
      reset: reset == freezed
          ? _value.reset
          : reset // ignore: cast_nullable_to_non_nullable
              as bool,
      tick: tick == freezed
          ? _value.tick
          : tick // ignore: cast_nullable_to_non_nullable
              as bool,
      tickEvery: tickEvery == freezed
          ? _value.tickEvery
          : tickEvery // ignore: cast_nullable_to_non_nullable
              as SoundEvery,
      beep: beep == freezed
          ? _value.beep
          : beep // ignore: cast_nullable_to_non_nullable
              as bool,
      beepEvery: beepEvery == freezed
          ? _value.beepEvery
          : beepEvery // ignore: cast_nullable_to_non_nullable
              as SoundEvery,
    ));
  }
}

/// @nodoc

class _$Settings extends Settings {
  const _$Settings(
      {required this.enabled,
      required this.expanded,
      required this.start,
      required this.stop,
      required this.reset,
      required this.tick,
      required this.tickEvery,
      required this.beep,
      required this.beepEvery})
      : super._();

  @override
  final bool enabled;
  @override
  final bool expanded;
  @override
  final bool start;
  @override
  final bool stop;
  @override
  final bool reset;
  @override
  final bool tick;
  @override
  final SoundEvery tickEvery;
  @override
  final bool beep;
  @override
  final SoundEvery beepEvery;

  @override
  String toString() {
    return 'SoundSettingsState(enabled: $enabled, expanded: $expanded, start: $start, stop: $stop, reset: $reset, tick: $tick, tickEvery: $tickEvery, beep: $beep, beepEvery: $beepEvery)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Settings &&
            const DeepCollectionEquality().equals(other.enabled, enabled) &&
            const DeepCollectionEquality().equals(other.expanded, expanded) &&
            const DeepCollectionEquality().equals(other.start, start) &&
            const DeepCollectionEquality().equals(other.stop, stop) &&
            const DeepCollectionEquality().equals(other.reset, reset) &&
            const DeepCollectionEquality().equals(other.tick, tick) &&
            const DeepCollectionEquality().equals(other.tickEvery, tickEvery) &&
            const DeepCollectionEquality().equals(other.beep, beep) &&
            const DeepCollectionEquality().equals(other.beepEvery, beepEvery));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(enabled),
      const DeepCollectionEquality().hash(expanded),
      const DeepCollectionEquality().hash(start),
      const DeepCollectionEquality().hash(stop),
      const DeepCollectionEquality().hash(reset),
      const DeepCollectionEquality().hash(tick),
      const DeepCollectionEquality().hash(tickEvery),
      const DeepCollectionEquality().hash(beep),
      const DeepCollectionEquality().hash(beepEvery));

  @JsonKey(ignore: true)
  @override
  _$$SettingsCopyWith<_$Settings> get copyWith =>
      __$$SettingsCopyWithImpl<_$Settings>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            bool enabled,
            bool expanded,
            bool start,
            bool stop,
            bool reset,
            bool tick,
            SoundEvery tickEvery,
            bool beep,
            SoundEvery beepEvery)
        $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return $default(enabled, expanded, start, stop, reset, tick, tickEvery,
        beep, beepEvery);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            bool enabled,
            bool expanded,
            bool start,
            bool stop,
            bool reset,
            bool tick,
            SoundEvery tickEvery,
            bool beep,
            SoundEvery beepEvery)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return $default?.call(enabled, expanded, start, stop, reset, tick,
        tickEvery, beep, beepEvery);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            bool enabled,
            bool expanded,
            bool start,
            bool stop,
            bool reset,
            bool tick,
            SoundEvery tickEvery,
            bool beep,
            SoundEvery beepEvery)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(enabled, expanded, start, stop, reset, tick, tickEvery,
          beep, beepEvery);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Settings value) $default, {
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(Settings value)? $default, {
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Settings value)? $default, {
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class Settings extends SoundSettingsState {
  const factory Settings(
      {required final bool enabled,
      required final bool expanded,
      required final bool start,
      required final bool stop,
      required final bool reset,
      required final bool tick,
      required final SoundEvery tickEvery,
      required final bool beep,
      required final SoundEvery beepEvery}) = _$Settings;
  const Settings._() : super._();

  bool get enabled => throw _privateConstructorUsedError;
  bool get expanded => throw _privateConstructorUsedError;
  bool get start => throw _privateConstructorUsedError;
  bool get stop => throw _privateConstructorUsedError;
  bool get reset => throw _privateConstructorUsedError;
  bool get tick => throw _privateConstructorUsedError;
  SoundEvery get tickEvery => throw _privateConstructorUsedError;
  bool get beep => throw _privateConstructorUsedError;
  SoundEvery get beepEvery => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$SettingsCopyWith<_$Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$SoundSettingsStateCopyWithImpl<$Res>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, (v) => _then(v as _$Initial));

  @override
  _$Initial get _value => super._value as _$Initial;
}

/// @nodoc

class _$Initial extends Initial {
  const _$Initial() : super._();

  @override
  String toString() {
    return 'SoundSettingsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            bool enabled,
            bool expanded,
            bool start,
            bool stop,
            bool reset,
            bool tick,
            SoundEvery tickEvery,
            bool beep,
            SoundEvery beepEvery)
        $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            bool enabled,
            bool expanded,
            bool start,
            bool stop,
            bool reset,
            bool tick,
            SoundEvery tickEvery,
            bool beep,
            SoundEvery beepEvery)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            bool enabled,
            bool expanded,
            bool start,
            bool stop,
            bool reset,
            bool tick,
            SoundEvery tickEvery,
            bool beep,
            SoundEvery beepEvery)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Settings value) $default, {
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(Settings value)? $default, {
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Settings value)? $default, {
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial extends SoundSettingsState {
  const factory Initial() = _$Initial;
  const Initial._() : super._();
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$SoundSettingsStateCopyWithImpl<$Res>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, (v) => _then(v as _$Loading));

  @override
  _$Loading get _value => super._value as _$Loading;
}

/// @nodoc

class _$Loading extends Loading {
  const _$Loading() : super._();

  @override
  String toString() {
    return 'SoundSettingsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            bool enabled,
            bool expanded,
            bool start,
            bool stop,
            bool reset,
            bool tick,
            SoundEvery tickEvery,
            bool beep,
            SoundEvery beepEvery)
        $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            bool enabled,
            bool expanded,
            bool start,
            bool stop,
            bool reset,
            bool tick,
            SoundEvery tickEvery,
            bool beep,
            SoundEvery beepEvery)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            bool enabled,
            bool expanded,
            bool start,
            bool stop,
            bool reset,
            bool tick,
            SoundEvery tickEvery,
            bool beep,
            SoundEvery beepEvery)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Settings value) $default, {
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(Settings value)? $default, {
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Settings value)? $default, {
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading extends SoundSettingsState {
  const factory Loading() = _$Loading;
  const Loading._() : super._();
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res> extends _$SoundSettingsStateCopyWithImpl<$Res>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, (v) => _then(v as _$Error));

  @override
  _$Error get _value => super._value as _$Error;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$Error(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Error extends Error {
  const _$Error([this.message]) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'SoundSettingsState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            bool enabled,
            bool expanded,
            bool start,
            bool stop,
            bool reset,
            bool tick,
            SoundEvery tickEvery,
            bool beep,
            SoundEvery beepEvery)
        $default, {
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(
            bool enabled,
            bool expanded,
            bool start,
            bool stop,
            bool reset,
            bool tick,
            SoundEvery tickEvery,
            bool beep,
            SoundEvery beepEvery)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            bool enabled,
            bool expanded,
            bool start,
            bool stop,
            bool reset,
            bool tick,
            SoundEvery tickEvery,
            bool beep,
            SoundEvery beepEvery)?
        $default, {
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Settings value) $default, {
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(Settings value)? $default, {
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Settings value)? $default, {
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error extends SoundSettingsState {
  const factory Error([final String? message]) = _$Error;
  const Error._() : super._();

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}
