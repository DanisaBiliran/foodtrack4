import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodtrack/main.dart';
import 'package:isar/isar.dart';
import 'package:foodtrack/database/food.dart'; // Import your Food model

void main() async {
  // Ensure Flutter is initialized before running tests
  WidgetsFlutterBinding.ensureInitialized();

  // Create a mock Isar instance
  final isar = await Isar.open([FoodSchema], directory: ''); // Use FoodSchema here

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(isar: isar)); // Pass the mock Isar instance

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
