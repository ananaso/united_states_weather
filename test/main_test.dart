// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:united_states_weather/future_weather.dart';
import 'package:http/http.dart' as http;
import 'package:united_states_weather/main.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets(
    'Defaults to Current Weather page',
    (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const UnitedStatesWeather());

      final elementFinder = find.byElementType(FutureWeather);

      expect(elementFinder, findsOneWidget);
    },
  );

  // testWidgets('Displays current temperature with unit',
  //     (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const UnitedStatesWeather());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
