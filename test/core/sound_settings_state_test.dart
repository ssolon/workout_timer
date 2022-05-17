import 'package:flutter_test/flutter_test.dart';
import 'package:workout_timer/core/sound/sound_settings/logic/sound_settings_state.dart';
import 'package:workout_timer/views/sound_config.dart';

/// Test out the state using the freezed stuff to be sure I understand it?

void main() {
  test('initial', () {
    const initialState = SoundSettingsState.initial();
    initialState.map(
      (value) => fail('Should be initial'),
      initial: (initial) => null,
      loading: (loading) => fail('Should be initial'),
      error: (err) => fail('Should be initial'),
    );
  });

  // test('data - check for defaults', () {
  //   const dataState = Settings();
  //   dataState.map(
  //     (data) {
  //       expect(data.enabled, true, reason: 'enabled');
  //       expect(data.start, false, reason: 'start');
  //       expect(data.stop, false, reason: 'stop');
  //       expect(data.reset, false, reason: 'reset');
  //       expect(data.tick, false, reason: 'tick');
  //       expect(data.beep, false, reason: 'beep');
  //       expect(data.tickEvery, SoundEvery.second, reason: 'tickEvery');
  //       expect(data.beepEvery, SoundEvery.minute, reason: 'beepEvery');
  //     },
  //     initial: (value) => fail('Should be data'),
  //     loading: (value) => fail('Should be data'),
  //     error: (value) => fail('Should be data'),
  //   );
  // });
}
