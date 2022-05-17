import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'sound_settings_state.dart';

part 'sound_settings_state_notifier.dart';

/// Provider to use the SoundSettingsStateNotifier
final soundSettingsNotifierProvider =
    StateNotifierProvider<SoundSettingsNotifier, SoundSettingsState>(
  (ref) => SoundSettingsNotifier(),
);

/// Repositories Providers
/// TODO: Create Repositories Providers

/// Use Cases Providers
/// TODO: Create Use Cases Providers