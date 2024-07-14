import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:united_states_weather/load_weather.dart' show fetchWeather;
import 'package:united_states_weather/types/gridpoint_forecast_json_ld.dart';

import 'fixtures/fetch_weather_request.dart';
import 'fixtures/weather_gov_forecast_error_json.dart';
import 'fixtures/weather_gov_forecast_hourly_response_json.dart';
@GenerateNiceMocks([MockSpec<http.Client>()])
import 'mocks/fetch_weather_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('fetchWeather', () {
    test('returns a textual forecast if the http call completes successfully',
        () async {
      final MockClient client = initializeClient();

      // Use Mockito to return a successful response when
      //  it calls the provided http.Client
      when(
        client.get(
          mockUri,
          headers: mockHeaders,
        ),
      ).thenAnswer(
        (_) async => http.Response(weatherGovForecastHourlyResponseJson, 200),
      );

      expect(await fetchWeather(client), isA<GridpointForecastJsonLd>());
    });

    test('throws an exception if the http call completes with an error', () {
      final MockClient client = initializeClient();

      when(
        client.get(
          mockUri,
          headers: mockHeaders,
        ),
      ).thenAnswer(
        (_) async => http.Response(weatherGovForecastErrorJson, 500),
      );
    });
  });
}

MockClient initializeClient() {
  final MockClient client = MockClient();
  SharedPreferences.setMockInitialValues({});

  return client;
}
