import 'package:freezed_annotation/freezed_annotation.dart';

part 'sound_settings_state.freezed.dart';

enum SoundEvery {
  second('every second', 1),
  tenSeconds('every 10 seconds', 10),
  thirtySeconds('every 30 seconds', 30),
  minute('every minute', 60);

  final String title;
  final int seconds;
  const SoundEvery(this.title, this.seconds);

  static Map<String, SoundEvery> map = {};

  /// Check for hit
  bool playIt(int durationSeconds) => durationSeconds % seconds == 0;

  /// Convert [s] to an enum entry (or null)
  static SoundEvery? from(String s) {
    if (map.isEmpty) {
      for (final e in SoundEvery.values) {
        map[e.name] = e;
      }
    }

    return map[s];
  }
}

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
