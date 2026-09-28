// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

/*import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_7/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_7/main1.dart';

void main() {
  testWidgets(
    'MyButton changes text when pressed',
    (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MyButton(),
          ),
        ),
      );

      // Check initial text
      expect(
        find.text('Press Me'),
        findsOneWidget,
      );

      expect(
        find.text('Pressed!'),
        findsNothing,
      );

      // Press the button
      await tester.tap(
        find.byType(ElevatedButton),
      );

      // Rebuild widget
      await tester.pump();

      // Check changed text
      expect(
        find.text('Press Me'),
        findsNothing,
      );

      expect(
        find.text('Pressed!'),
        findsOneWidget,
      );
    },
  );
}