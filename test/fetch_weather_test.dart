import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:united_states_weather/fetch_weather.dart';

import 'fixtures/weather_gov_forecast_error_json.dart';
import 'fixtures/weather_gov_forecast_response_json.dart';
import 'mocks/fetch_weather_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks(<Type>[http.Client])
void main() {
  group('fetchWeather', () {
    test('returns a textual forecast if the http call completes successfully',
        () async {
      final MockClient client = MockClient();

      // Use Mockito to return a successful response when
      //  it calls the provided http.Client
      when(
        client.get(
          Uri.parse(
            'https://api.weather.gov/gridpoints/LOX/148,36/forecast',
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response(weatherGovForecastResponseJsonString, 200),
      );

      expect(await fetchWeather(client), isA<Map<String, dynamic>>());
    });
  });

  test('throws an exception if the http call completes with an error', () {
    final MockClient client = MockClient();

    when(
      client.get(
        Uri.parse(
          'https://api.weather.gov/gridpoints/LOX/148,36/forecast',
        ),
      ),
    ).thenAnswer(
      (_) async => http.Response(weatherGovForecastErrorJsonString, 500),
    );
  });
}
