// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:united_states_weather/future_weather.dart';

import 'fixtures/weather_gov_forecast_response_json.dart';
import 'mocks/future_weater_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets('Displays current temperature with unit',
      (WidgetTester tester) async {
    final client = MockClient();

    when(
      client.get(
        Uri.parse(
          'https://api.weather.gov/gridpoints/LOX/148,36/forecast',
        ),
        headers: {'Accept': 'application/ld+json'},
      ),
    ).thenAnswer(
      (_) async => http.Response(weatherGovForecastResponseJson, 200),
    );

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      FutureWeather(
        client: client,
      ),
    );

    expect(find.text('55 °F'), findsOneWidget);
  });

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
