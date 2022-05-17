import 'package:flutter_test/flutter_test.dart';
import 'package:workout_timer/core/sound/sound_settings/logic/sound_settings_state.dart';

/// Test out the SoundEvery enum

void main() {
  test('everySecond', () {
    expect(
        SoundEvery.second.playIt(const Duration(seconds: 1).inSeconds), true);
    expect(
        SoundEvery.second.playIt(const Duration(seconds: 2).inSeconds), true);
    expect(
        SoundEvery.second.playIt(const Duration(minutes: 5).inSeconds), true);
    expect(SoundEvery.second.playIt(const Duration(hours: 1).inSeconds), true);
  });

  test('everyTenSeconds', () {
    expect(SoundEvery.tenSeconds.playIt(const Duration(seconds: 1).inSeconds),
        false);
    expect(SoundEvery.tenSeconds.playIt(const Duration(seconds: 2).inSeconds),
        false);
    expect(SoundEvery.tenSeconds.playIt(const Duration(seconds: 10).inSeconds),
        true);
    expect(SoundEvery.tenSeconds.playIt(const Duration(minutes: 5).inSeconds),
        true);
    expect(
        SoundEvery.tenSeconds.playIt(const Duration(hours: 1).inSeconds), true);
  });

  test('everyThirtySeconds', () {
    expect(
        SoundEvery.thirtySeconds.playIt(const Duration(seconds: 1).inSeconds),
        false);
    expect(
        SoundEvery.thirtySeconds.playIt(const Duration(seconds: 2).inSeconds),
        false);
    expect(
        SoundEvery.thirtySeconds.playIt(const Duration(seconds: 30).inSeconds),
        true);
    expect(
        SoundEvery.thirtySeconds.playIt(const Duration(seconds: 40).inSeconds),
        false);
    expect(
        SoundEvery.thirtySeconds.playIt(const Duration(seconds: 60).inSeconds),
        true);
    expect(
        SoundEvery.thirtySeconds.playIt(const Duration(minutes: 5).inSeconds),
        true);
    expect(
        SoundEvery.thirtySeconds
            .playIt(const Duration(minutes: 5, seconds: 30).inSeconds),
        true);
    expect(
        SoundEvery.thirtySeconds
            .playIt(const Duration(minutes: 5, seconds: 40).inSeconds),
        false);
    expect(SoundEvery.thirtySeconds.playIt(const Duration(hours: 1).inSeconds),
        true);
  });

  test('everyMinute', () {
    expect(
        SoundEvery.minute.playIt(const Duration(seconds: 1).inSeconds), false);
    expect(
        SoundEvery.minute.playIt(const Duration(seconds: 2).inSeconds), false);
    expect(
        SoundEvery.minute.playIt(const Duration(seconds: 30).inSeconds), false);
    expect(
        SoundEvery.minute.playIt(const Duration(seconds: 40).inSeconds), false);
    expect(
        SoundEvery.minute.playIt(const Duration(seconds: 60).inSeconds), true);
    expect(
        SoundEvery.minute.playIt(const Duration(minutes: 5).inSeconds), true);
    expect(
        SoundEvery.minute
            .playIt(const Duration(minutes: 5, seconds: 30).inSeconds),
        false);
    expect(SoundEvery.minute.playIt(const Duration(hours: 1).inSeconds), true);
  });
}
