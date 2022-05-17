import 'package:audioplayers/audioplayers.dart';

/// Sound effects handling

/// The player. Initialized elsewhere (main.dart)
AudioCache? player;

/// The effects, and their files, that we can play.
enum AudioEffect {
  tick("tap.wav"),
  beep("microwave-beep.wav"),
  stop("beep4.wav"),
  reset("menu-beep.wav");

  final String fileName;

  const AudioEffect(this.fileName);

  play() async {
    return await player?.play(fileName);
  }
}

play(String fileName) async {
  return await player?.play(fileName);
}

playTick() async => play(AudioEffect.tick.fileName);
playBeep() async => play(AudioEffect.beep.fileName);
playReset() async => play(AudioEffect.reset.fileName);
