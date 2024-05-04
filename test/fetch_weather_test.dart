import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:united_states_weather/fetch_weather.dart';

import 'fetch_weather_test.mocks.dart';

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
        (_) async => http.Response(jsonEncode(mockWeatherGovResponseJson), 200),
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
      (_) async => http.Response(jsonEncode(mockWeatherGovErrorJson), 500),
    );
  });
}

const Map<String, Object> mockWeatherGovResponseJson = <String, Object>{
  '@context': <Object>[
    'https://geojson.org/geojson-ld/geojson-context.jsonld',
    <String, String>{
      '@version': '1.1',
      'wx': 'https://api.weather.gov/ontology#',
      'geo': 'http://www.opengis.net/ont/geosparql#',
      'unit': 'http://codes.wmo.int/common/unit/',
      '@vocab': 'https://api.weather.gov/ontology#',
    }
  ],
  'type': 'Feature',
  'geometry': <String, Object>{
    'type': 'Polygon',
    'coordinates': <List<List<double>>>[
      <List<double>>[
        <double>[-118.4074018, 33.835615300000001],
        <double>[-118.4027399, 33.813404900000002],
        <double>[-118.3759623, 33.817281700000002],
        <double>[-118.3806192, 33.8394926],
        <double>[-118.4074018, 33.835615300000001],
      ]
    ],
  },
  'properties': <String, Object>{
    'updated': '2024-05-04T17:32:34+00:00',
    'units': 'us',
    'forecastGenerator': 'BaselineForecastGenerator',
    'generatedAt': '2024-05-04T18:19:36+00:00',
    'updateTime': '2024-05-04T17:32:34+00:00',
    'validTimes': '2024-05-04T11:00:00+00:00/P7DT14H',
    'elevation': <String, Object>{'unitCode': 'wmoUnit:m', 'value': 0},
    'periods': <Map<String, Object?>>[
      <String, Object?>{
        'number': 1,
        'name': 'Today',
        'startTime': '2024-05-04T11:00:00-07:00',
        'endTime': '2024-05-04T18:00:00-07:00',
        'isDaytime': true,
        'temperature': 62,
        'temperatureUnit': 'F',
        'temperatureTrend': null,
        'probabilityOfPrecipitation': <String, Object>{
          'unitCode': 'wmoUnit:percent',
          'value': 20,
        },
        'dewpoint': <String, Object>{
          'unitCode': 'wmoUnit:degC',
          'value': 12.777777777777779,
        },
        'relativeHumidity': <String, Object>{
          'unitCode': 'wmoUnit:percent',
          'value': 85,
        },
        'windSpeed': '15 mph',
        'windDirection': 'WSW',
        'icon':
            'https://api.weather.gov/icons/land/day/bkn/rain,20?size=medium',
        'shortForecast': 'Mostly Cloudy then Slight Chance Light Rain',
        'detailedForecast':
            'A slight chance of rain after 5pm. Mostly cloudy, with a high near 62. West southwest wind around 15 mph, with gusts as high as 20 mph. Chance of precipitation is 20%. New rainfall amounts less than a tenth of an inch possible.',
      },
      <String, Object?>{
        'number': 2,
        'name': 'Tonight',
        'startTime': '2024-05-04T18:00:00-07:00',
        'endTime': '2024-05-05T06:00:00-07:00',
        'isDaytime': false,
        'temperature': 56,
        'temperatureUnit': 'F',
        'temperatureTrend': null,
        'probabilityOfPrecipitation': <String, Object>{
          'unitCode': 'wmoUnit:percent',
          'value': 40,
        },
        'dewpoint': <String, Object>{
          'unitCode': 'wmoUnit:degC',
          'value': 12.222222222222221,
        },
        'relativeHumidity': <String, Object>{
          'unitCode': 'wmoUnit:percent',
          'value': 91,
        },
        'windSpeed': '15 mph',
        'windDirection': 'WSW',
        'icon': 'https://api.weather.gov/icons/land/night/rain,40?size=medium',
        'shortForecast': 'Chance Light Rain',
        'detailedForecast':
            'A chance of rain before 5am. Mostly cloudy, with a low around 56. West southwest wind around 15 mph, with gusts as high as 25 mph. Chance of precipitation is 40%. New rainfall amounts less than a tenth of an inch possible.',
      },
      <String, Object?>{
        'number': 3,
        'name': 'Sunday',
        'startTime': '2024-05-05T06:00:00-07:00',
        'endTime': '2024-05-05T18:00:00-07:00',
        'isDaytime': true,
        'temperature': 62,
        'temperatureUnit': 'F',
        'temperatureTrend': null,
        'probabilityOfPrecipitation': <String, String?>{
          'unitCode': 'wmoUnit:percent',
          'value': null,
        },
        'dewpoint': <String, Object>{
          'unitCode': 'wmoUnit:degC',
          'value': 7.7777777777777777,
        },
        'relativeHumidity': <String, Object>{
          'unitCode': 'wmoUnit:percent',
          'value': 63,
        },
        'windSpeed': '15 to 25 mph',
        'windDirection': 'W',
        'icon': 'https://api.weather.gov/icons/land/day/wind_few?size=medium',
        'shortForecast': 'Sunny',
        'detailedForecast':
            'Sunny, with a high near 62. West wind 15 to 25 mph, with gusts as high as 35 mph.',
      },
      <String, Object?>{
        'number': 4,
        'name': 'Sunday Night',
        'startTime': '2024-05-05T18:00:00-07:00',
        'endTime': '2024-05-06T06:00:00-07:00',
        'isDaytime': false,
        'temperature': 54,
        'temperatureUnit': 'F',
        'temperatureTrend': null,
        'probabilityOfPrecipitation': <String, String?>{
          'unitCode': 'wmoUnit:percent',
          'value': null,
        },
        'dewpoint': <String, Object>{
          'unitCode': 'wmoUnit:degC',
          'value': 8.8888888888888893,
        },
        'relativeHumidity': <String, Object>{
          'unitCode': 'wmoUnit:percent',
          'value': 76,
        },
        'windSpeed': '5 to 25 mph',
        'windDirection': 'NE',
        'icon': 'https://api.weather.gov/icons/land/night/wind_sct?size=medium',
        'shortForecast': 'Partly Cloudy',
        'detailedForecast':
            'Partly cloudy, with a low around 54. Northeast wind 5 to 25 mph, with gusts as high as 35 mph.',
      },
      <String, Object?>{
        'number': 5,
        'name': 'Monday',
        'startTime': '2024-05-06T06:00:00-07:00',
        'endTime': '2024-05-06T18:00:00-07:00',
        'isDaytime': true,
        'temperature': 63,
        'temperatureUnit': 'F',
        'temperatureTrend': null,
        'probabilityOfPrecipitation': <String, String?>{
          'unitCode': 'wmoUnit:percent',
          'value': null,
        },
        'dewpoint': <String, Object>{
          'unitCode': 'wmoUnit:degC',
          'value': 12.222222222222221,
        },
        'relativeHumidity': <String, Object>{
          'unitCode': 'wmoUnit:percent',
          'value': 76,
        },
        'windSpeed': '5 to 20 mph',
        'windDirection': 'WSW',
        'icon': 'https://api.weather.gov/icons/land/day/sct?size=medium',
        'shortForecast': 'Mostly Sunny',
        'detailedForecast':
            'Mostly sunny, with a high near 63. West southwest wind 5 to 20 mph, with gusts as high as 25 mph.',
      },
      <String, Object?>{
        'number': 6,
        'name': 'Monday Night',
        'startTime': '2024-05-06T18:00:00-07:00',
        'endTime': '2024-05-07T06:00:00-07:00',
        'isDaytime': false,
        'temperature': 55,
        'temperatureUnit': 'F',
        'temperatureTrend': null,
        'probabilityOfPrecipitation': <String, String?>{
          'unitCode': 'wmoUnit:percent',
          'value': null,
        },
        'dewpoint': <String, Object>{
          'unitCode': 'wmoUnit:degC',
          'value': 11.666666666666666,
        },
        'relativeHumidity': <String, Object>{
          'unitCode': 'wmoUnit:percent',
          'value': 85,
        },
        'windSpeed': '5 to 20 mph',
        'windDirection': 'SE',
        'icon': 'https://api.weather.gov/icons/land/night/few?size=medium',
        'shortForecast': 'Mostly Clear',
        'detailedForecast': 'Mostly clear, with a low around 55.',
      },
      <String, Object?>{
        'number': 7,
        'name': 'Tuesday',
        'startTime': '2024-05-07T06:00:00-07:00',
        'endTime': '2024-05-07T18:00:00-07:00',
        'isDaytime': true,
        'temperature': 63,
        'temperatureUnit': 'F',
        'temperatureTrend': null,
        'probabilityOfPrecipitation': <String, String?>{
          'unitCode': 'wmoUnit:percent',
          'value': null,
        },
        'dewpoint': <String, Object>{
          'unitCode': 'wmoUnit:degC',
          'value': 13.333333333333334,
        },
        'relativeHumidity': <String, Object>{
          'unitCode': 'wmoUnit:percent',
          'value': 87,
        },
        'windSpeed': '5 to 10 mph',
        'windDirection': 'SSE',
        'icon': 'https://api.weather.gov/icons/land/day/few?size=medium',
        'shortForecast': 'Sunny',
        'detailedForecast': 'Sunny, with a high near 63.',
      },
      <String, Object?>{
        'number': 8,
        'name': 'Tuesday Night',
        'startTime': '2024-05-07T18:00:00-07:00',
        'endTime': '2024-05-08T06:00:00-07:00',
        'isDaytime': false,
        'temperature': 56,
        'temperatureUnit': 'F',
        'temperatureTrend': null,
        'probabilityOfPrecipitation': <String, String?>{
          'unitCode': 'wmoUnit:percent',
          'value': null,
        },
        'dewpoint': <String, Object>{
          'unitCode': 'wmoUnit:degC',
          'value': 12.222222222222221,
        },
        'relativeHumidity': <String, Object>{
          'unitCode': 'wmoUnit:percent',
          'value': 89,
        },
        'windSpeed': '5 to 10 mph',
        'windDirection': 'SSE',
        'icon': 'https://api.weather.gov/icons/land/night/few?size=medium',
        'shortForecast': 'Mostly Clear',
        'detailedForecast': 'Mostly clear, with a low around 56.',
      },
      <String, Object?>{
        'number': 9,
        'name': 'Wednesday',
        'startTime': '2024-05-08T06:00:00-07:00',
        'endTime': '2024-05-08T18:00:00-07:00',
        'isDaytime': true,
        'temperature': 63,
        'temperatureUnit': 'F',
        'temperatureTrend': null,
        'probabilityOfPrecipitation': <String, String?>{
          'unitCode': 'wmoUnit:percent',
          'value': null,
        },
        'dewpoint': <String, Object>{
          'unitCode': 'wmoUnit:degC',
          'value': 13.888888888888889,
        },
        'relativeHumidity': <String, Object>{
          'unitCode': 'wmoUnit:percent',
          'value': 89,
        },
        'windSpeed': '5 to 15 mph',
        'windDirection': 'S',
        'icon': 'https://api.weather.gov/icons/land/day/few?size=medium',
        'shortForecast': 'Sunny',
        'detailedForecast': 'Sunny, with a high near 63.',
      },
      <String, Object?>{
        'number': 10,
        'name': 'Wednesday Night',
        'startTime': '2024-05-08T18:00:00-07:00',
        'endTime': '2024-05-09T06:00:00-07:00',
        'isDaytime': false,
        'temperature': 57,
        'temperatureUnit': 'F',
        'temperatureTrend': null,
        'probabilityOfPrecipitation': <String, String?>{
          'unitCode': 'wmoUnit:percent',
          'value': null,
        },
        'dewpoint': <String, Object>{
          'unitCode': 'wmoUnit:degC',
          'value': 12.777777777777779,
        },
        'relativeHumidity': <String, Object>{
          'unitCode': 'wmoUnit:percent',
          'value': 89,
        },
        'windSpeed': '5 to 15 mph',
        'windDirection': 'SSE',
        'icon': 'https://api.weather.gov/icons/land/night/few?size=medium',
        'shortForecast': 'Mostly Clear',
        'detailedForecast': 'Mostly clear, with a low around 57.',
      },
      <String, Object?>{
        'number': 11,
        'name': 'Thursday',
        'startTime': '2024-05-09T06:00:00-07:00',
        'endTime': '2024-05-09T18:00:00-07:00',
        'isDaytime': true,
        'temperature': 65,
        'temperatureUnit': 'F',
        'temperatureTrend': null,
        'probabilityOfPrecipitation': <String, String?>{
          'unitCode': 'wmoUnit:percent',
          'value': null,
        },
        'dewpoint': <String, Object>{
          'unitCode': 'wmoUnit:degC',
          'value': 14.444444444444445,
        },
        'relativeHumidity': <String, Object>{
          'unitCode': 'wmoUnit:percent',
          'value': 89,
        },
        'windSpeed': '5 to 10 mph',
        'windDirection': 'SSE',
        'icon': 'https://api.weather.gov/icons/land/day/few?size=medium',
        'shortForecast': 'Sunny',
        'detailedForecast': 'Sunny, with a high near 65.',
      },
      <String, Object?>{
        'number': 12,
        'name': 'Thursday Night',
        'startTime': '2024-05-09T18:00:00-07:00',
        'endTime': '2024-05-10T06:00:00-07:00',
        'isDaytime': false,
        'temperature': 57,
        'temperatureUnit': 'F',
        'temperatureTrend': null,
        'probabilityOfPrecipitation': <String, String?>{
          'unitCode': 'wmoUnit:percent',
          'value': null,
        },
        'dewpoint': <String, Object>{
          'unitCode': 'wmoUnit:degC',
          'value': 13.888888888888889,
        },
        'relativeHumidity': <String, Object>{
          'unitCode': 'wmoUnit:percent',
          'value': 89,
        },
        'windSpeed': '5 to 10 mph',
        'windDirection': 'S',
        'icon': 'https://api.weather.gov/icons/land/night/sct/fog?size=medium',
        'shortForecast': 'Partly Cloudy then Patchy Fog',
        'detailedForecast':
            'Patchy fog after 5am. Partly cloudy, with a low around 57.',
      },
      <String, Object?>{
        'number': 13,
        'name': 'Friday',
        'startTime': '2024-05-10T06:00:00-07:00',
        'endTime': '2024-05-10T18:00:00-07:00',
        'isDaytime': true,
        'temperature': 66,
        'temperatureUnit': 'F',
        'temperatureTrend': null,
        'probabilityOfPrecipitation': <String, String?>{
          'unitCode': 'wmoUnit:percent',
          'value': null,
        },
        'dewpoint': <String, Object>{'unitCode': 'wmoUnit:degC', 'value': 15},
        'relativeHumidity': <String, Object>{
          'unitCode': 'wmoUnit:percent',
          'value': 88,
        },
        'windSpeed': '5 to 15 mph',
        'windDirection': 'S',
        'icon': 'https://api.weather.gov/icons/land/day/fog/bkn?size=medium',
        'shortForecast': 'Patchy Fog then Partly Sunny',
        'detailedForecast':
            'Patchy fog before 11am. Partly sunny, with a high near 66.',
      },
      <String, Object?>{
        'number': 14,
        'name': 'Friday Night',
        'startTime': '2024-05-10T18:00:00-07:00',
        'endTime': '2024-05-11T06:00:00-07:00',
        'isDaytime': false,
        'temperature': 58,
        'temperatureUnit': 'F',
        'temperatureTrend': null,
        'probabilityOfPrecipitation': <String, String?>{
          'unitCode': 'wmoUnit:percent',
          'value': null,
        },
        'dewpoint': <String, Object>{
          'unitCode': 'wmoUnit:degC',
          'value': 13.888888888888889,
        },
        'relativeHumidity': <String, Object>{
          'unitCode': 'wmoUnit:percent',
          'value': 89,
        },
        'windSpeed': '5 to 15 mph',
        'windDirection': 'WSW',
        'icon': 'https://api.weather.gov/icons/land/night/fog?size=medium',
        'shortForecast': 'Patchy Fog',
        'detailedForecast':
            'Patchy fog after 11pm. Mostly cloudy, with a low around 58.',
      }
    ],
  },
};

const Map<String, Object> mockWeatherGovErrorJson = <String, Object>{
  'type': 'urn:noaa:nws:api:UnexpectedProblem',
  'title': 'Unexpected Problem',
  'status': 500,
  'detail': 'An unexpected problem has occurred.',
  'instance': 'urn:noaa:nws:api:request:493c3a1d-f87e-407f-ae2c-24483f5aab63',
  'correlationId': '493c3a1d-f87e-407f-ae2c-24483f5aab63',
};
