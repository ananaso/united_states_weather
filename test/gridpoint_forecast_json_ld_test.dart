import 'package:flutter_test/flutter_test.dart';
import 'package:united_states_weather/gridpoint_forecast_json_ld.dart';

import 'fixtures/weather_gov_forecast_response_json.dart';

void main() {
  group('GridpointForecastJsonLd', () {
    const fullResponseJson = weatherGovForecastResponseJsonMap;
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

    test('deserializes JSON to all fields', () {
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

  group('QuantitativeValue', () {
    const jsonAllFields = {
      'maxValue': 12000,
      'minValue': 0,
      'qualityControl': 'G',
      'unitCode': 'wmoUnit:m',
      'value': 9001,
    };
    const jsonRequiredFields = {'unitCode': 'wmoUnit:m'};

    test(
      'deserializes JSON to all fields',
      () {
        const expectedQV = jsonAllFields;

        final actualQV = QuantitativeValue.fromJson(expectedQV);

        expect(actualQV.maxValue, expectedQV['maxValue']);
        expect(actualQV.minValue, expectedQV['minValue']);
        expect(actualQV.qualityControl?.name, expectedQV['qualityControl']);
        expect(actualQV.unitCode, expectedQV['unitCode']);
        expect(actualQV.value, expectedQV['value']);
      },
    );

    test('deserializes JSON with just the required fields', () {
      const expectedQV = jsonRequiredFields;

      final actualQV = QuantitativeValue.fromJson(expectedQV);

      expect(actualQV.unitCode, expectedQV['unitCode']);
    });

    test('throws FormatException if unitCode is missing', () {
      const Map<String, dynamic> actualQv = {};

      expect(
        () => QuantitativeValue.fromJson(actualQv),
        throwsA(isA<FormatException>()),
      );
    });

    test('serializes all fields to JSON', () {
      const expectedJson = jsonAllFields;

      final qv = QuantitativeValue.fromJson(expectedJson);
      final actualJson = qv.toJson();

      expect(actualJson, expectedJson);
    });

    test('serializes just required fields to JSON', () {
      const expectedJson = jsonRequiredFields;

      final qv = QuantitativeValue.fromJson(expectedJson);
      final actualJson = qv.toJson();

      expect(actualJson, expectedJson);
    });
  });
}
