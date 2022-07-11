import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_golden_test_alchemist/main.dart';

void main() {
  Future<void> loadWidget(WidgetTester tester) async {
    const myApp = MyApp();
    await tester.pumpWidget(myApp);
  }

  testWidgets('Verify that our counter starts at 0', (WidgetTester tester) async {
    await loadWidget(tester);
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Verify that our counter not starts at 1', (WidgetTester tester) async {
    await loadWidget(tester);
    expect(find.text('1'), findsNothing);
  });

  testWidgets("Verify that our counter has't incremented.", (WidgetTester tester) async {
    await loadWidget(tester);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('0'), findsNothing);
  });

  testWidgets('Verify that our counter has incremented.', (WidgetTester tester) async {
    await loadWidget(tester);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });

}
