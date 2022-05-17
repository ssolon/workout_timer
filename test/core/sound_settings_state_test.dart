import 'package:flutter_test/flutter_test.dart';
import 'package:workout_timer/core/sound/sound_settings/logic/sound_settings_state.dart';

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
}
