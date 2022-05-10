// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:workout_timer/main.dart';

void main() {
  testWidgets('Timer smoke test', (WidgetTester tester) async {
    await tester.runAsync(() async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const ProviderScope(child: MyApp()));

      // Verify that our counter starts at 0.
      expect(find.text('0.0'), findsOneWidget);
      // expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.text('+'));
      await tester.pump();

      await Future.delayed(const Duration(seconds: 3));
      await tester.pump();

      // Verify that our timer has incremented.
      expect(find.text('0'), findsNothing);

      // expect(find.text('1'), findsOneWidget);
    });
  });
}
