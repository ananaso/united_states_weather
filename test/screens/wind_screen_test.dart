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
import 'package:mockito/mockito.dart';
import 'package:united_states_weather/pref_key.dart';
import 'package:united_states_weather/screens/wind_screen.dart';
import 'package:united_states_weather/types/wind_direction.dart';

import '../fixtures/fetch_weather_request.dart';
import '../fixtures/weather_gov_forecast_hourly_response_json.dart';
@GenerateNiceMocks([MockSpec<http.Client>()])
import '../mocks/screens/wind_screen_test.mocks.dart';
import '../utils/mock_weather_api.dart';
import '../utils/with_directionality.dart';

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

      expect(find.text('5 to 10 mph'), findsOneWidget);
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

      expect(find.text('W'), findsOneWidget);
      expect(find.byIcon(Symbols.arrow_upward), findsOneWidget);
    });

    testWidgets('loads data from cache if exists', (tester) async {
      final client = MockClient();
      final mockCache = <String, Object>{
        PrefKey.forecastHourly.name: weatherGovForecastHourlyResponseJson,
        PrefKey.cacheExpiration.name: DateTime.timestamp()
            .add(const Duration(hours: 3))
            .millisecondsSinceEpoch,
      };

      // return 500 if test tries to fetch (i.e. skips cache)
      mockWeatherApi(
        client: client,
        initialCache: mockCache,
        returnError: true,
      );

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        withDirectionality(
          WindScreen(
            client: client,
          ),
        ),
      );

      await renderWeatherData(tester);

      expect(find.text('5 to 10 mph'), findsOneWidget);
      expect(find.text('W'), findsOneWidget);
      expect(find.byIcon(Symbols.arrow_upward), findsOneWidget);
      verifyNever(client.get(mockUri, headers: mockHeaders));
    });

    testWidgets('fetches fresh data if cache exists but is stale',
        (tester) async {
      final client = MockClient();
      final mockCache = <String, Object>{
        PrefKey.forecastHourly.name: weatherGovForecastHourlyResponseJson,
        PrefKey.cacheExpiration.name: DateTime.timestamp()
            .subtract(const Duration(hours: 3))
            .millisecondsSinceEpoch,
      };

      mockWeatherApi(
        client: client,
        initialCache: mockCache,
      );

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        withDirectionality(
          WindScreen(
            client: client,
          ),
        ),
      );

      await renderWeatherData(tester);

      expect(find.text('5 to 10 mph'), findsOneWidget);
      expect(find.text('W'), findsOneWidget);
      expect(find.byIcon(Symbols.arrow_upward), findsOneWidget);
      verify(client.get(mockUri, headers: mockHeaders));
    });
  });

  // This is a semi-weak test but I'm too lazy to check each actual val for now
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
