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

  group('GridpointForecastPeriod', () {
    test('deserializes JSON to all fields', () {
      const actualGFP = {
        'number': 1,
        'name': 'Tonight',
        'startTime': '2024-05-04T20:00:00-07:00',
        'endTime': '2024-05-05T06:00:00-07:00',
        'isDaytime': false,
        'temperature': 55,
        'temperatureUnit': 'F',
        'temperatureTrend': null,
        'probabilityOfPrecipitation': {
          'unitCode': 'wmoUnit:percent',
          'value': 40,
        },
        'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.777777777777779},
        'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 91},
        'windSpeed': '15 mph',
        'windGust': '25 mph',
        'windDirection': 'WSW',
        'icon': 'https://api.weather.gov/icons/land/night/rain,40?size=medium',
        'shortForecast': 'Chance Light Rain',
        'detailedForecast':
            'A chance of rain before 5am. Mostly cloudy, with a low around 55. West southwest wind around 15 mph, with gusts as high as 25 mph. Chance of precipitation is 40%. New rainfall amounts less than a tenth of an inch possible.',
      };

      final expectedGFP = GridpointForecastPeriod.fromJson(actualGFP);

      expect(expectedGFP.number, actualGFP['number']);
      expect(expectedGFP.name, actualGFP['name']);
      expect(expectedGFP.startTime, actualGFP['startTime']);
      expect(expectedGFP.endTime, actualGFP['endTime']);
      expect(expectedGFP.isDaytime, actualGFP['isDaytime']);
      expect(expectedGFP.temperature, actualGFP['temperature']);
      expect(expectedGFP.temperatureUnit, actualGFP['temperatureUnit']);
      expect(expectedGFP.temperatureTrend, actualGFP['temperatureTrend']);
      expect(
        expectedGFP.probabilityOfPrecipitation.toJson(),
        actualGFP['probabilityOfPrecipitation'],
      );
      expect(
        expectedGFP.dewpoint.toJson(),
        actualGFP['dewpoint'],
      );
      expect(
        expectedGFP.relativeHumidity.toJson(),
        actualGFP['relativeHumidity'],
      );
      expect(expectedGFP.windSpeed, actualGFP['windSpeed']);
      expect(expectedGFP.windGust, actualGFP['windGust']);
      expect(expectedGFP.windDirection, actualGFP['windDirection']);
      expect(expectedGFP.icon, actualGFP['icon']);
      expect(expectedGFP.shortForecast, actualGFP['shortForecast']);
      expect(expectedGFP.detailedForecast, actualGFP['detailedForecast']);
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
