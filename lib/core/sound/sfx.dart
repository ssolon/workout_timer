import 'package:audioplayers/audioplayers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:workout_timer/core/sound/sound_settings/logic/sound_settings_provider.dart';

/// Sound effects handling

/// Provider for playing sounds
final soundPlayerProvider = Provider((ref) => SoundPlayer(ref));

/// Handle playing sounds both from AudioEffect definitions or an arbitrary
/// file.
///
/// Accessed by [soundPlayerProvider].
///
class SoundPlayer {
  final Ref ref;

  /// Do not use -- access through [soundPlayerProvider].
  SoundPlayer(this.ref);

  /// Play sound from [fileName] if sound is enabled.
  play(String fileName) async {
    final enabled = ref.read(soundSettingsNotifierProvider).enabled;

    if (enabled) {
      return await player?.play(fileName);
    }
  }

  /// Play sound for [effect] if sound is enabled.
  playEffect(AudioEffect effect) async => play(effect.fileName);

  /// Play tick sound if sound is enabled.
  playTick() async => playEffect(AudioEffect.tick);

  /// Play beep sound if sound is enabled.
  playBeep() async => playEffect(AudioEffect.beep);

  /// Play start sound if sound enabled.
  playStart() async => playEffect(AudioEffect.start);

  /// Play stop sound if sound enabled.
  playStop() async => playEffect(AudioEffect.stop);

  /// Play reset sound if sound is enabled.
  playReset() async => playEffect(AudioEffect.reset);
}

/// The player. Initialized elsewhere (main.dart)
AudioCache? player;

/// The effects, and their files, that we can play.
enum AudioEffect {
  tick("tap.wav"),
  beep("microwave-beep.wav"),
  start("start_beep3.wav"),
  stop("stop_beep3.wav"),
  // stop("beep4.wav"), // Maybe use for routine/done?
  // reset("menu-beep.wav"),
  reset("poof-in-cloud.mp3");

  final String fileName;

  const AudioEffect(this.fileName);
}
