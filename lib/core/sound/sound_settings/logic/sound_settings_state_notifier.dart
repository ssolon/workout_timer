part of 'sound_settings_provider.dart';

/// Defines all the SoundSettings logic the app will use
class SoundSettingsNotifier extends StateNotifier<SoundSettingsState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  SoundSettingsNotifier()
      : super(const SoundSettingsState(
          enabled: true,
          expanded: true,
          start: false,
          stop: false,
          reset: false,
          tick: false,
          tickEvery: SoundEvery.second,
          beep: false,
          beepEvery: SoundEvery.minute,
        ));

  /// Return either the current settings state or a default
  Settings get settings {
    return state.map((data) => data,
        initial: (initial) =>
            throw UnsupportedError("Can't get setting in initial state"),
        loading: (loading) =>
            throw UnsupportedError("Can't get settings in loading state"),
        error: (error) =>
            throw UnsupportedError("Can't get settings in error state"));
  }

  void setEnabled(bool isEnabled) {
    state = settings.copyWith(enabled: isEnabled);
  }

  void setExpanded(bool isExpanded) {
    state = settings.copyWith(expanded: isExpanded);
  }

  void setStart(bool? startSound) {
    state = settings.copyWith(start: startSound ?? false);
  }

  void setStop(bool? stopSound) {
    state = settings.copyWith(stop: stopSound ?? false);
  }

  void setReset(bool? resetSound) {
    state = settings.copyWith(reset: resetSound ?? false);
  }

  void setTick(bool? tick) {
    state = settings.copyWith(tick: tick ?? false);
  }

  void setBeep(bool? beep) {
    state = settings.copyWith(beep: beep ?? false);
  }

  void setTickEvery(SoundEvery? every) {
    if (every != null) {
      state = settings.copyWith(tickEvery: every);
    }
  }

  void setBeepEvery(SoundEvery? every) {
    if (every != null) {
      state = settings.copyWith(beepEvery: every);
    }
  }
}
