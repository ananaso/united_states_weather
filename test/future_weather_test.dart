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
import 'package:united_states_weather/future_weather.dart';
import 'package:united_states_weather/pref_key.dart';

import 'fixtures/weather_gov_forecast_hourly_response_json.dart';
import 'mocks/future_weather_test.mocks.dart';
import 'utils/mock_weather_api.dart';
import 'utils/with_directionality.dart';

@GenerateMocks([http.Client])
void main() {
  group('FutureWeather', () {
    testWidgets('Displays current temperature with unit', (tester) async {
      final client = MockClient();

      mockWeatherApi(client);

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        withDirectionality(
          FutureWeather(
            client: client,
          ),
        ),
      );

      await renderWeatherData(tester);

      expect(find.text('63 °F'), findsOneWidget);
    });

    testWidgets('Displays current status as text', (tester) async {
      final client = MockClient();

      mockWeatherApi(client);

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        withDirectionality(
          FutureWeather(
            client: client,
          ),
        ),
      );

      await renderWeatherData(tester);

      expect(find.text('Clear'), findsOneWidget);
      expect(find.byIcon(Symbols.clear_night), findsNothing);
    });

    testWidgets('loads data from cache if exists', (tester) async {
      final client = MockClient();
      final mockCache = <String, Object>{
        PrefKey.forecastHourly.name: weatherGovForecastHourlyResponseJson,
      };
      SharedPreferences.setMockInitialValues(mockCache);

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        withDirectionality(
          FutureWeather(
            client: client,
          ),
        ),
      );

      await renderWeatherData(tester);

      final tempTextFinder = find.text('63 °F');
      final forecastTextFinder = find.text('Clear');

      expect(tempTextFinder, findsOneWidget);
      expect(forecastTextFinder, findsOneWidget);
    });
  });
}
