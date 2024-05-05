import 'package:flutter_test/flutter_test.dart';
import 'package:united_states_weather/gridpoint_forecast_json_ld.dart';

import 'fixtures/weather_gov_forecast_response_json.dart';

void main() {
  group('GridpointForecastJsonLd', () {
    const fullResponseJson = weatherGovForecastResponseJson;
    final context = fullResponseJson['@context'];
    final geometry = fullResponseJson['geometry'];
    final updated = fullResponseJson['updated'];
    final units = fullResponseJson['units'];
    final forecastGenerator = fullResponseJson['forecastGenerator'];
    final generatedAt = fullResponseJson['generatedAt'];
    final updateTime = fullResponseJson['updateTime'];
    final validTimes = fullResponseJson['validTimes'];
    final elevation = fullResponseJson['elevation'];
    final periods = fullResponseJson['periods'];

    test('returns the JSON serialized into a plain model class', () {
      final weatherData = GridpointForecastJsonLd.fromJson(fullResponseJson);

      expect(
        weatherData.context,
        context,
      );
      expect(
        weatherData.geometry,
        geometry,
      );
      expect(
        weatherData.updated,
        updated,
      );
      expect(
        weatherData.units,
        units,
      );
      expect(
        weatherData.forecastGenerator,
        forecastGenerator,
      );
      expect(
        weatherData.generatedAt,
        generatedAt,
      );
      expect(
        weatherData.updateTime,
        updateTime,
      );
      expect(
        weatherData.validTimes,
        validTimes,
      );
      expect(
        weatherData.elevation,
        elevation,
      );
      expect(
        weatherData.periods,
        periods,
      );
    });
  });
}
