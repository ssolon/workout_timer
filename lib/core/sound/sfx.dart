import 'package:audioplayers/audioplayers.dart';

/// Sound effects handling

/// The player. Initialized elsewhere (main.dart)
AudioCache? player;

/// The effects, and their files, that we can play.
enum AudioEffect {
  tick("tap.wav");

  final String fileName;

  const AudioEffect(this.fileName);
}

playTick() async {
  return await player?.play(AudioEffect.tick.fileName);
}
