import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workout_timer/views/sound_config.dart';

part 'sound_settings_state.freezed.dart';

@freezed
class SoundSettingsState with _$SoundSettingsState {
  const SoundSettingsState._();

  /// Settings is present state
  const factory SoundSettingsState({
    required bool enabled,
    required bool expanded,
    required bool start,
    required bool stop,
    required bool reset,
    required bool tick,
    required SoundEvery tickEvery,
    required bool beep,
    required SoundEvery beepEvery,
  }) = Settings;

  /// Initial/default state
  const factory SoundSettingsState.initial() = Initial;

  /// Data is loading state
  const factory SoundSettingsState.loading() = Loading;

  /// Error when loading data state
  const factory SoundSettingsState.error([String? message]) = Error;
}
