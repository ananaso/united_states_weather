import 'package:flutter_test/flutter_test.dart';
import 'package:united_states_weather/types/gridpoint_forecast_period.dart';

import '../fixtures/quantitative_value_json.dart';

void main() {
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
      'dewpoint': null,
      'relativeHumidity': null,
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
        actualGFP.dewpoint?.toJson(),
        expectedGFP['dewpoint'],
      );
      expect(
        actualGFP.relativeHumidity?.toJson(),
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
      expect(actualGFP.dewpoint, null);
      expect(actualGFP.relativeHumidity, null);
      expect(actualGFP.windGust, null);
    });

    // programmatic exception testing for required fields
    jsonOptionalFieldsNulled.forEach(
      (key, value) {
        // ignore nullable fields since they don't throw exceptions when null
        if (value != null) {
          test('throws FormatException if $key is missing', () {
            final Map<String, dynamic> actualGFP = {
              ...jsonOptionalFieldsNulled,
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
}
