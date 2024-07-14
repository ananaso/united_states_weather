import 'package:flutter_test/flutter_test.dart';
import 'package:united_states_weather/types/gridpoint_forecast_json_ld.dart';

import '../fixtures/gridpoint_forecast_period_json.dart';
import '../fixtures/quantitative_value_json.dart';

void main() {
  group('GridpointForecastJsonLd', () {
    final jsonAllFields = {
      '@context': {
        '@version': '1.1',
        'wx': 'https://api.weather.gov/ontology#',
        'geo': 'http://www.opengis.net/ont/geosparql#',
        'unit': 'http://codes.wmo.int/common/unit/',
        '@vocab': 'https://api.weather.gov/ontology#',
      },
      'geometry':
          'POLYGON((-118.4074018 33.8356153,-118.4027399 33.8134049,-118.3759623 33.8172817,-118.3806192 33.8394926,-118.4074018 33.8356153))',
      'units': 'us',
      'forecastGenerator': 'BaselineForecastGenerator',
      'generatedAt': '2024-05-05T03:08:38+00:00',
      'updateTime': '2024-05-05T02:10:26+00:00',
      'validTimes': '2024-05-04T20:00:00+00:00/P7DT8H',
      'elevation': mockQV,
      'periods': [mockGFP(number: 0), mockGFP(number: 1), mockGFP(number: 2)],
    };

    test('deserializes JSON to all fields', () {
      final expectedGFJL = jsonAllFields;

      final actualGFJL = GridpointForecastJsonLd.fromJson(expectedGFJL);

      expect(
        actualGFJL.geometry,
        expectedGFJL['geometry'],
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
}
