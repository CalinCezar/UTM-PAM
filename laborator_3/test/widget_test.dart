import 'package:flutter_test/flutter_test.dart';

import 'package:laborator_3/main.dart';

void main() {
  testWidgets('News app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const NewsApp());

    // Verify that the welcome text is displayed
    expect(find.text('Welcome back, Tyler!'), findsOneWidget);

    // Verify that trending news section exists
    expect(find.text('Trending news'), findsOneWidget);

    // Verify that recommendation section exists
    expect(find.text('Recommendation'), findsOneWidget);
  });
}
