import 'package:flutter_test/flutter_test.dart';
import 'package:united_states_weather/gridpoint_forecast_json_ld.dart';

import 'mocks/gridpoint_forecast_json_ld_test.mocks.dart';

void main() {
  group('GridpointForecastJsonLd', () {
    const jsonAllFields = {
      '@context': {
        '@version': '1.1',
        'wx': 'https://api.weather.gov/ontology#',
        'geo': 'http://www.opengis.net/ont/geosparql#',
        'unit': 'http://codes.wmo.int/common/unit/',
        '@vocab': 'https://api.weather.gov/ontology#',
      },
      'geometry':
          'POLYGON((-118.4074018 33.8356153,-118.4027399 33.8134049,-118.3759623 33.8172817,-118.3806192 33.8394926,-118.4074018 33.8356153))',
      'updated': '2024-05-05T02:10:26+00:00',
      'units': 'us',
      'forecastGenerator': 'BaselineForecastGenerator',
      'generatedAt': '2024-05-05T03:08:38+00:00',
      'updateTime': '2024-05-05T02:10:26+00:00',
      'validTimes': '2024-05-04T20:00:00+00:00/P7DT8H',
      'elevation': mockQV,
      'periods': [mockGFP],
    };

    test('deserializes JSON to all fields', () {
      const expectedGFJL = jsonAllFields;

      final actualGFJL = GridpointForecastJsonLd.fromJson(expectedGFJL);

      expect(
        actualGFJL.geometry,
        expectedGFJL['geometry'],
      );
      expect(
        actualGFJL.updated,
        expectedGFJL['updated'],
      );
      expect(
        actualGFJL.units.name,
        expectedGFJL['units'],
      );
      expect(
        actualGFJL.forecastGenerator,
        expectedGFJL['forecastGenerator'],
      );
      expect(
        actualGFJL.generatedAt,
        expectedGFJL['generatedAt'],
      );
      expect(
        actualGFJL.updateTime,
        expectedGFJL['updateTime'],
      );
      expect(
        actualGFJL.validTimes,
        expectedGFJL['validTimes'],
      );
      expect(
        actualGFJL.elevation.toJson(),
        expectedGFJL['elevation'],
      );
      expect(
        actualGFJL.periods.map((period) => period.toJson()),
        expectedGFJL['periods'],
      );
    });
  });

  group('GridpointForecastPeriod', () {
    const jsonAllFields = {
      'number': 1,
      'name': 'Tonight',
      'startTime': '2024-05-04T20:00:00-07:00',
      'endTime': '2024-05-05T06:00:00-07:00',
      'isDaytime': false,
      'temperature': 55,
      'temperatureUnit': 'F',
      'temperatureTrend': '[fake value] falling?',
      'probabilityOfPrecipitation': mockQV,
      'dewpoint': mockQV,
      'relativeHumidity': mockQV,
      'windSpeed': '15 mph',
      'windGust': '[fake value] 25 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/night/rain,40?size=medium',
      'shortForecast': 'Chance Light Rain',
      'detailedForecast':
          'A chance of rain before 5am. Mostly cloudy, with a low around 55. West southwest wind around 15 mph, with gusts as high as 25 mph. Chance of precipitation is 40%. New rainfall amounts less than a tenth of an inch possible.',
    };
    const jsonOptionalFieldsNulled = {
      'number': 1,
      'name': 'Tonight',
      'startTime': '2024-05-04T20:00:00-07:00',
      'endTime': '2024-05-05T06:00:00-07:00',
      'isDaytime': false,
      'temperature': 55,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': mockQV,
      'dewpoint': mockQV,
      'relativeHumidity': mockQV,
      'windSpeed': '15 mph',
      'windGust': null,
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/night/rain,40?size=medium',
      'shortForecast': 'Chance Light Rain',
      'detailedForecast':
          'A chance of rain before 5am. Mostly cloudy, with a low around 55. West southwest wind around 15 mph, with gusts as high as 25 mph. Chance of precipitation is 40%. New rainfall amounts less than a tenth of an inch possible.',
    };

    test('deserializes JSON to all fields', () {
      const expectedGFP = jsonAllFields;

      final actualGFP = GridpointForecastPeriod.fromJson(expectedGFP);

      expect(actualGFP.number, expectedGFP['number']);
      expect(actualGFP.name, expectedGFP['name']);
      expect(actualGFP.startTime, expectedGFP['startTime']);
      expect(actualGFP.endTime, expectedGFP['endTime']);
      expect(actualGFP.isDaytime, expectedGFP['isDaytime']);
      expect(actualGFP.temperature, expectedGFP['temperature']);
      expect(actualGFP.temperatureUnit, expectedGFP['temperatureUnit']);
      expect(actualGFP.temperatureTrend, expectedGFP['temperatureTrend']);
      expect(
        actualGFP.probabilityOfPrecipitation.toJson(),
        expectedGFP['probabilityOfPrecipitation'],
      );
      expect(
        actualGFP.dewpoint.toJson(),
        expectedGFP['dewpoint'],
      );
      expect(
        actualGFP.relativeHumidity.toJson(),
        expectedGFP['relativeHumidity'],
      );
      expect(actualGFP.windSpeed, expectedGFP['windSpeed']);
      expect(actualGFP.windGust, expectedGFP['windGust']);
      expect(actualGFP.windDirection, expectedGFP['windDirection']);
      expect(actualGFP.icon, expectedGFP['icon']);
      expect(actualGFP.shortForecast, expectedGFP['shortForecast']);
      expect(actualGFP.detailedForecast, expectedGFP['detailedForecast']);
    });

    test('deserializes JSON with just the required fields', () {
      const expectedGFP = jsonOptionalFieldsNulled;

      final actualGFP = GridpointForecastPeriod.fromJson(expectedGFP);

      expect(actualGFP.temperatureTrend, null);
      expect(actualGFP.windGust, null);
    });

    // programmatic exception testing for required fields
    jsonOptionalFieldsNulled.forEach(
      (key, value) {
        // ignore nullable fields since they don't throw exceptions when null
        if (value != null) {
          test('throws FormatException if $key is missing', () {
            final Map<String, dynamic> actualGFP = {
              ...jsonOptionalFieldsNulled
            };
            actualGFP.remove(key);

            expect(
              () => GridpointForecastPeriod.fromJson(actualGFP),
              throwsA(isA<FormatException>()),
            );
          });
        }
      },
    );

    test('serializes all fields to JSON', () {
      const expectedJson = jsonAllFields;

      final gfp = GridpointForecastPeriod.fromJson(expectedJson);
      final actualJson = gfp.toJson();

      expect(actualJson, expectedJson);
    });

    test('serializes nullable fields to JSON', () {
      const expectedJson = jsonOptionalFieldsNulled;

      final gfp = GridpointForecastPeriod.fromJson(expectedJson);
      final actualJson = gfp.toJson();

      expect(actualJson, expectedJson);
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
    const jsonOptionalFieldsNulled = {
      'maxValue': null,
      'minValue': null,
      'qualityControl': null,
      'unitCode': 'wmoUnit:m',
      'value': null,
    };

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
      const expectedQV = jsonOptionalFieldsNulled;

      final actualQV = QuantitativeValue.fromJson(expectedQV);

      expect(actualQV.maxValue, null);
      expect(actualQV.minValue, null);
      expect(actualQV.qualityControl, null);
      expect(actualQV.value, null);
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

    test('serializes nullable fields to JSON', () {
      const expectedJson = jsonOptionalFieldsNulled;

      final qv = QuantitativeValue.fromJson(expectedJson);
      final actualJson = qv.toJson();

      expect(actualJson, expectedJson);
    });
  });
}
