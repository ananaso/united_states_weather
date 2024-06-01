// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:material_symbols_icons/symbols.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:united_states_weather/pref_key.dart';
import 'package:united_states_weather/types/wind_direction.dart';
import 'package:united_states_weather/screens/weather_screen.dart';
import 'package:united_states_weather/screens/wind_screen.dart';

import '../fixtures/weather_gov_forecast_hourly_response_json.dart';
import '../mocks/future_weather_test.mocks.dart';
import '../utils/mock_weather_api.dart';
import '../utils/with_directionality.dart';

@GenerateMocks([http.Client])
void main() {
  group('WindScreen', () {
    testWidgets('Displays current wind speed with unit', (tester) async {
      final client = MockClient();

      mockWeatherApi(client: client);

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        withDirectionality(
          WindScreen(
            client: client,
          ),
        ),
      );

      await renderWeatherData(tester);

      final windSpeedTextFinder = find.text('10 mph');

      expect(windSpeedTextFinder, findsOneWidget);
    });

    testWidgets('Displays current wind direction with directional arrow',
        (tester) async {
      final client = MockClient();

      mockWeatherApi(client: client);

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        withDirectionality(
          WindScreen(
            client: client,
          ),
        ),
      );

      await renderWeatherData(tester);

      final windDirectionTextFinder = find.text('SW');
      final windDirectionIconFinder = find.byIcon(Symbols.arrow_upward);

      expect(windDirectionTextFinder, findsOneWidget);
      expect(windDirectionIconFinder, findsOneWidget);
    });

    testWidgets(
      'loads data from cache if exists',
      (tester) async {
        final client = MockClient();
        final mockCache = <String, Object>{
          PrefKey.forecastHourly.name: weatherGovForecastHourlyResponseJson,
        };
        SharedPreferences.setMockInitialValues(mockCache);

        // Build our app and trigger a frame.
        await tester.pumpWidget(
          withDirectionality(
            WeatherScreen(
              client: client,
            ),
          ),
        );

        await renderWeatherData(tester);

        final tempTextFinder = find.text('63 °F');
        final forecastTextFinder = find.text('Clear');

        expect(tempTextFinder, findsOneWidget);
        expect(forecastTextFinder, findsOneWidget);
      },
      skip: true,
    );
  });

  // This is a semi-weak test but I'm too lazy to check each actual val
  group('compassDirectionToRadians', () {
    test('handles all directions in WindDirection enum', () {
      for (final windDirection in WindDirection.values) {
        expect(
          () => compassDirectionToRadians(windDirection.name),
          returnsNormally,
        );
      }
    });
  });
}
