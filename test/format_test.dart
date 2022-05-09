/// Test out formatting routines

import 'package:flutter_test/flutter_test.dart';
import 'package:workout_timer/main.dart';

void main() {
  group('formatDuration', () {
    test('Empty', () {
      const d0 = Duration.zero;
      String f0 = formatDuration(d0);
      expect(f0, '0', reason: 'Only one zero shown for empty');
    });

    test('Single digit seconds', () {
      const d = Duration(seconds: 7);
      String s = formatDuration(d);

      expect(s, '7');
    });

    test('Multiple digits seconds', () {
      const d = Duration(seconds: 12);
      final s = formatDuration(d);
      expect(s, '12');
    });

    test('Millis', () {
      const d = Duration(milliseconds: 1);
      final s = formatDuration(d);
      expect(s, '0.1');
    });

    test('Seconds with millis', () {
      const d = Duration(seconds: 7, milliseconds: 10);
      final s = formatDuration(d);
      expect(s, '7.10');
    });

    test('Minutes only', () {
      const d1 = Duration(minutes: 7);
      const d2 = Duration(minutes: 12);

      final s1 = formatDuration(d1);
      final s2 = formatDuration(d2);

      expect(s1, '7:00');
      expect(s2, '12:00');
    });

    test('Hours only', () {
      const d1 = Duration(hours: 7);
      const d2 = Duration(hours: 12);

      final s1 = formatDuration(d1);
      final s2 = formatDuration(d2);

      expect(s1, '7:00:00');
      expect(s2, '12:00:00');
    });

    test('All with millis', () {
      const d1 = Duration(hours: 7, minutes: 6, seconds: 5, milliseconds: 400);
      final s1 = formatDuration(d1);
      expect(s1, '7:06:05.400');
    });
  });
}
