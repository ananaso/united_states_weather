// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';

String weatherGovForecastHourlyResponseJson =
    jsonEncode(weatherGovForecastHourlyResponseJsonMap);

const Map<String, Object> weatherGovForecastHourlyResponseJsonMap =
    <String, Object>{
  '@context': {
    '@version': '1.1',
    'wx': 'https://api.weather.gov/ontology#',
    'geo': 'http://www.opengis.net/ont/geosparql#',
    'unit': 'http://codes.wmo.int/common/unit/',
    '@vocab': 'https://api.weather.gov/ontology#',
  },
  'geometry':
      'POLYGON((-118.4074018 33.8356153,-118.4027399 33.8134049,-118.3759623 33.8172817,-118.3806192 33.8394926,-118.4074018 33.8356153))',
  'updated': '2024-05-08T23:04:16+00:00',
  'units': 'us',
  'forecastGenerator': 'HourlyForecastGenerator',
  'generatedAt': '2024-05-09T03:00:50+00:00',
  'updateTime': '2024-05-08T23:04:16+00:00',
  'validTimes': '2024-05-08T17:00:00+00:00/P7DT8H',
  'elevation': {'unitCode': 'wmoUnit:m', 'value': 0},
  'periods': [
    {
      'number': 1,
      'name': '',
      'startTime': '2024-05-08T20:00:00-07:00',
      'endTime': '2024-05-08T21:00:00-07:00',
      'isDaytime': false,
      'temperature': 63,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.111111111111111},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 69},
      'windSpeed': '10 mph',
      'windDirection': 'SW',
      'icon': 'https://api.weather.gov/icons/land/night/skc,0?size=small',
      'shortForecast': 'Clear',
      'detailedForecast': '',
    },
    {
      'number': 2,
      'name': '',
      'startTime': '2024-05-08T21:00:00-07:00',
      'endTime': '2024-05-08T22:00:00-07:00',
      'isDaytime': false,
      'temperature': 63,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.111111111111111},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 70},
      'windSpeed': '10 mph',
      'windDirection': 'SW',
      'icon': 'https://api.weather.gov/icons/land/night/skc,0?size=small',
      'shortForecast': 'Clear',
      'detailedForecast': '',
    },
    {
      'number': 3,
      'name': '',
      'startTime': '2024-05-08T22:00:00-07:00',
      'endTime': '2024-05-08T23:00:00-07:00',
      'isDaytime': false,
      'temperature': 63,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.111111111111111},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 70},
      'windSpeed': '10 mph',
      'windDirection': 'SW',
      'icon': 'https://api.weather.gov/icons/land/night/skc,0?size=small',
      'shortForecast': 'Clear',
      'detailedForecast': '',
    },
    {
      'number': 4,
      'name': '',
      'startTime': '2024-05-08T23:00:00-07:00',
      'endTime': '2024-05-09T00:00:00-07:00',
      'isDaytime': false,
      'temperature': 61,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 10},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 69},
      'windSpeed': '5 mph',
      'windDirection': 'S',
      'icon': 'https://api.weather.gov/icons/land/night/ovc,0?size=small',
      'shortForecast': 'Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 5,
      'name': '',
      'startTime': '2024-05-09T00:00:00-07:00',
      'endTime': '2024-05-09T01:00:00-07:00',
      'isDaytime': false,
      'temperature': 61,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 10},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 69},
      'windSpeed': '5 mph',
      'windDirection': 'S',
      'icon': 'https://api.weather.gov/icons/land/night/ovc,0?size=small',
      'shortForecast': 'Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 6,
      'name': '',
      'startTime': '2024-05-09T01:00:00-07:00',
      'endTime': '2024-05-09T02:00:00-07:00',
      'isDaytime': false,
      'temperature': 60,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.222222222222221},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 84},
      'windSpeed': '5 mph',
      'windDirection': 'S',
      'icon': 'https://api.weather.gov/icons/land/night/ovc,0?size=small',
      'shortForecast': 'Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 7,
      'name': '',
      'startTime': '2024-05-09T02:00:00-07:00',
      'endTime': '2024-05-09T03:00:00-07:00',
      'isDaytime': false,
      'temperature': 59,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.777777777777779},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 91},
      'windSpeed': '5 mph',
      'windDirection': 'ESE',
      'icon': 'https://api.weather.gov/icons/land/night/ovc,0?size=small',
      'shortForecast': 'Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 8,
      'name': '',
      'startTime': '2024-05-09T03:00:00-07:00',
      'endTime': '2024-05-09T04:00:00-07:00',
      'isDaytime': false,
      'temperature': 58,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.222222222222221},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 91},
      'windSpeed': '5 mph',
      'windDirection': 'ESE',
      'icon': 'https://api.weather.gov/icons/land/night/ovc,0?size=small',
      'shortForecast': 'Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 9,
      'name': '',
      'startTime': '2024-05-09T04:00:00-07:00',
      'endTime': '2024-05-09T05:00:00-07:00',
      'isDaytime': false,
      'temperature': 58,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.222222222222221},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 90},
      'windSpeed': '5 mph',
      'windDirection': 'ESE',
      'icon': 'https://api.weather.gov/icons/land/night/ovc,0?size=small',
      'shortForecast': 'Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 10,
      'name': '',
      'startTime': '2024-05-09T05:00:00-07:00',
      'endTime': '2024-05-09T06:00:00-07:00',
      'isDaytime': false,
      'temperature': 57,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.666666666666666},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 89},
      'windSpeed': '5 mph',
      'windDirection': 'ESE',
      'icon': 'https://api.weather.gov/icons/land/night/ovc,0?size=small',
      'shortForecast': 'Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 11,
      'name': '',
      'startTime': '2024-05-09T06:00:00-07:00',
      'endTime': '2024-05-09T07:00:00-07:00',
      'isDaytime': true,
      'temperature': 57,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.111111111111111},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 88},
      'windSpeed': '5 mph',
      'windDirection': 'ESE',
      'icon': 'https://api.weather.gov/icons/land/day/ovc,0?size=small',
      'shortForecast': 'Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 12,
      'name': '',
      'startTime': '2024-05-09T07:00:00-07:00',
      'endTime': '2024-05-09T08:00:00-07:00',
      'isDaytime': true,
      'temperature': 57,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.666666666666666},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 89},
      'windSpeed': '5 mph',
      'windDirection': 'ESE',
      'icon': 'https://api.weather.gov/icons/land/day/ovc,0?size=small',
      'shortForecast': 'Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 13,
      'name': '',
      'startTime': '2024-05-09T08:00:00-07:00',
      'endTime': '2024-05-09T09:00:00-07:00',
      'isDaytime': true,
      'temperature': 57,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.111111111111111},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 87},
      'windSpeed': '5 mph',
      'windDirection': 'SE',
      'icon': 'https://api.weather.gov/icons/land/day/ovc,0?size=small',
      'shortForecast': 'Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 14,
      'name': '',
      'startTime': '2024-05-09T09:00:00-07:00',
      'endTime': '2024-05-09T10:00:00-07:00',
      'isDaytime': true,
      'temperature': 59,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.666666666666666},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 84},
      'windSpeed': '5 mph',
      'windDirection': 'SE',
      'icon': 'https://api.weather.gov/icons/land/day/ovc,0?size=small',
      'shortForecast': 'Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 15,
      'name': '',
      'startTime': '2024-05-09T10:00:00-07:00',
      'endTime': '2024-05-09T11:00:00-07:00',
      'isDaytime': true,
      'temperature': 62,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.777777777777779},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 82},
      'windSpeed': '5 mph',
      'windDirection': 'SE',
      'icon': 'https://api.weather.gov/icons/land/day/ovc,0?size=small',
      'shortForecast': 'Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 16,
      'name': '',
      'startTime': '2024-05-09T11:00:00-07:00',
      'endTime': '2024-05-09T12:00:00-07:00',
      'isDaytime': true,
      'temperature': 64,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 13.333333333333334},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 79},
      'windSpeed': '10 mph',
      'windDirection': 'SSW',
      'icon': 'https://api.weather.gov/icons/land/day/few,0?size=small',
      'shortForecast': 'Sunny',
      'detailedForecast': '',
    },
    {
      'number': 17,
      'name': '',
      'startTime': '2024-05-09T12:00:00-07:00',
      'endTime': '2024-05-09T13:00:00-07:00',
      'isDaytime': true,
      'temperature': 66,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 13.333333333333334},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 75},
      'windSpeed': '10 mph',
      'windDirection': 'SSW',
      'icon': 'https://api.weather.gov/icons/land/day/few,0?size=small',
      'shortForecast': 'Sunny',
      'detailedForecast': '',
    },
    {
      'number': 18,
      'name': '',
      'startTime': '2024-05-09T13:00:00-07:00',
      'endTime': '2024-05-09T14:00:00-07:00',
      'isDaytime': true,
      'temperature': 66,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 13.888888888888889},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 76},
      'windSpeed': '10 mph',
      'windDirection': 'SSW',
      'icon': 'https://api.weather.gov/icons/land/day/few,0?size=small',
      'shortForecast': 'Sunny',
      'detailedForecast': '',
    },
    {
      'number': 19,
      'name': '',
      'startTime': '2024-05-09T14:00:00-07:00',
      'endTime': '2024-05-09T15:00:00-07:00',
      'isDaytime': true,
      'temperature': 64,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 13.333333333333334},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 79},
      'windSpeed': '15 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/day/few,0?size=small',
      'shortForecast': 'Sunny',
      'detailedForecast': '',
    },
    {
      'number': 20,
      'name': '',
      'startTime': '2024-05-09T15:00:00-07:00',
      'endTime': '2024-05-09T16:00:00-07:00',
      'isDaytime': true,
      'temperature': 64,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 13.333333333333334},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 79},
      'windSpeed': '15 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/day/few,0?size=small',
      'shortForecast': 'Sunny',
      'detailedForecast': '',
    },
    {
      'number': 21,
      'name': '',
      'startTime': '2024-05-09T16:00:00-07:00',
      'endTime': '2024-05-09T17:00:00-07:00',
      'isDaytime': true,
      'temperature': 63,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 13.333333333333334},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 83},
      'windSpeed': '15 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/day/few,0?size=small',
      'shortForecast': 'Sunny',
      'detailedForecast': '',
    },
    {
      'number': 22,
      'name': '',
      'startTime': '2024-05-09T17:00:00-07:00',
      'endTime': '2024-05-09T18:00:00-07:00',
      'isDaytime': true,
      'temperature': 61,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 13.333333333333334},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 87},
      'windSpeed': '15 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/day/sct,0?size=small',
      'shortForecast': 'Mostly Sunny',
      'detailedForecast': '',
    },
    {
      'number': 23,
      'name': '',
      'startTime': '2024-05-09T18:00:00-07:00',
      'endTime': '2024-05-09T19:00:00-07:00',
      'isDaytime': false,
      'temperature': 59,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.777777777777779},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 89},
      'windSpeed': '15 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/night/sct,0?size=small',
      'shortForecast': 'Partly Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 24,
      'name': '',
      'startTime': '2024-05-09T19:00:00-07:00',
      'endTime': '2024-05-09T20:00:00-07:00',
      'isDaytime': false,
      'temperature': 58,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.222222222222221},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 90},
      'windSpeed': '15 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/night/sct,0?size=small',
      'shortForecast': 'Partly Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 25,
      'name': '',
      'startTime': '2024-05-09T20:00:00-07:00',
      'endTime': '2024-05-09T21:00:00-07:00',
      'isDaytime': false,
      'temperature': 57,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.222222222222221},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 92},
      'windSpeed': '10 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/night/sct,0?size=small',
      'shortForecast': 'Partly Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 26,
      'name': '',
      'startTime': '2024-05-09T21:00:00-07:00',
      'endTime': '2024-05-09T22:00:00-07:00',
      'isDaytime': false,
      'temperature': 57,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.222222222222221},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 92},
      'windSpeed': '10 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/night/sct,0?size=small',
      'shortForecast': 'Partly Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 27,
      'name': '',
      'startTime': '2024-05-09T22:00:00-07:00',
      'endTime': '2024-05-09T23:00:00-07:00',
      'isDaytime': false,
      'temperature': 56,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.666666666666666},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 92},
      'windSpeed': '10 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/night/sct,0?size=small',
      'shortForecast': 'Partly Cloudy',
      'detailedForecast': '',
    },
    {
      'number': 28,
      'name': '',
      'startTime': '2024-05-09T23:00:00-07:00',
      'endTime': '2024-05-10T00:00:00-07:00',
      'isDaytime': false,
      'temperature': 56,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.666666666666666},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 92},
      'windSpeed': '5 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/night/fog,0?size=small',
      'shortForecast': 'Patchy Fog',
      'detailedForecast': '',
    },
    {
      'number': 29,
      'name': '',
      'startTime': '2024-05-10T00:00:00-07:00',
      'endTime': '2024-05-10T01:00:00-07:00',
      'isDaytime': false,
      'temperature': 56,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.666666666666666},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 92},
      'windSpeed': '5 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/night/fog,0?size=small',
      'shortForecast': 'Patchy Fog',
      'detailedForecast': '',
    },
    {
      'number': 30,
      'name': '',
      'startTime': '2024-05-10T01:00:00-07:00',
      'endTime': '2024-05-10T02:00:00-07:00',
      'isDaytime': false,
      'temperature': 56,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.666666666666666},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 92},
      'windSpeed': '5 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/night/fog,0?size=small',
      'shortForecast': 'Patchy Fog',
      'detailedForecast': '',
    },
    {
      'number': 31,
      'name': '',
      'startTime': '2024-05-10T02:00:00-07:00',
      'endTime': '2024-05-10T03:00:00-07:00',
      'isDaytime': false,
      'temperature': 56,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.666666666666666},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 92},
      'windSpeed': '0 mph',
      'windDirection': 'SSW',
      'icon': 'https://api.weather.gov/icons/land/night/fog,0?size=small',
      'shortForecast': 'Patchy Fog',
      'detailedForecast': '',
    },
    {
      'number': 32,
      'name': '',
      'startTime': '2024-05-10T03:00:00-07:00',
      'endTime': '2024-05-10T04:00:00-07:00',
      'isDaytime': false,
      'temperature': 57,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.222222222222221},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 92},
      'windSpeed': '0 mph',
      'windDirection': 'SSW',
      'icon': 'https://api.weather.gov/icons/land/night/fog,0?size=small',
      'shortForecast': 'Patchy Fog',
      'detailedForecast': '',
    },
    {
      'number': 33,
      'name': '',
      'startTime': '2024-05-10T04:00:00-07:00',
      'endTime': '2024-05-10T05:00:00-07:00',
      'isDaytime': false,
      'temperature': 57,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.222222222222221},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 92},
      'windSpeed': '0 mph',
      'windDirection': 'SSW',
      'icon': 'https://api.weather.gov/icons/land/night/fog,0?size=small',
      'shortForecast': 'Patchy Fog',
      'detailedForecast': '',
    },
    {
      'number': 34,
      'name': '',
      'startTime': '2024-05-10T05:00:00-07:00',
      'endTime': '2024-05-10T06:00:00-07:00',
      'isDaytime': false,
      'temperature': 56,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.666666666666666},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 93},
      'windSpeed': '0 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/night/fog,0?size=small',
      'shortForecast': 'Patchy Fog',
      'detailedForecast': '',
    },
    {
      'number': 35,
      'name': '',
      'startTime': '2024-05-10T06:00:00-07:00',
      'endTime': '2024-05-10T07:00:00-07:00',
      'isDaytime': true,
      'temperature': 56,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.666666666666666},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 92},
      'windSpeed': '0 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/day/fog,0?size=small',
      'shortForecast': 'Patchy Fog',
      'detailedForecast': '',
    },
    {
      'number': 36,
      'name': '',
      'startTime': '2024-05-10T07:00:00-07:00',
      'endTime': '2024-05-10T08:00:00-07:00',
      'isDaytime': true,
      'temperature': 56,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.666666666666666},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 92},
      'windSpeed': '0 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/day/fog,0?size=small',
      'shortForecast': 'Patchy Fog',
      'detailedForecast': '',
    },
    {
      'number': 37,
      'name': '',
      'startTime': '2024-05-10T08:00:00-07:00',
      'endTime': '2024-05-10T09:00:00-07:00',
      'isDaytime': true,
      'temperature': 56,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.111111111111111},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 90},
      'windSpeed': '5 mph',
      'windDirection': 'ENE',
      'icon': 'https://api.weather.gov/icons/land/day/fog,0?size=small',
      'shortForecast': 'Patchy Fog',
      'detailedForecast': '',
    },
    {
      'number': 38,
      'name': '',
      'startTime': '2024-05-10T09:00:00-07:00',
      'endTime': '2024-05-10T10:00:00-07:00',
      'isDaytime': true,
      'temperature': 57,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.111111111111111},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 87},
      'windSpeed': '5 mph',
      'windDirection': 'ENE',
      'icon': 'https://api.weather.gov/icons/land/day/fog,0?size=small',
      'shortForecast': 'Patchy Fog',
      'detailedForecast': '',
    },
    {
      'number': 39,
      'name': '',
      'startTime': '2024-05-10T10:00:00-07:00',
      'endTime': '2024-05-10T11:00:00-07:00',
      'isDaytime': true,
      'temperature': 60,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.222222222222221},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 84},
      'windSpeed': '5 mph',
      'windDirection': 'ENE',
      'icon': 'https://api.weather.gov/icons/land/day/fog,0?size=small',
      'shortForecast': 'Patchy Fog',
      'detailedForecast': '',
    },
    {
      'number': 40,
      'name': '',
      'startTime': '2024-05-10T11:00:00-07:00',
      'endTime': '2024-05-10T12:00:00-07:00',
      'isDaytime': true,
      'temperature': 61,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.222222222222221},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 81},
      'windSpeed': '5 mph',
      'windDirection': 'SW',
      'icon': 'https://api.weather.gov/icons/land/day/few,0?size=small',
      'shortForecast': 'Sunny',
      'detailedForecast': '',
    },
    {
      'number': 41,
      'name': '',
      'startTime': '2024-05-10T12:00:00-07:00',
      'endTime': '2024-05-10T13:00:00-07:00',
      'isDaytime': true,
      'temperature': 61,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.222222222222221},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 80},
      'windSpeed': '5 mph',
      'windDirection': 'SW',
      'icon': 'https://api.weather.gov/icons/land/day/few,0?size=small',
      'shortForecast': 'Sunny',
      'detailedForecast': '',
    },
    {
      'number': 42,
      'name': '',
      'startTime': '2024-05-10T13:00:00-07:00',
      'endTime': '2024-05-10T14:00:00-07:00',
      'isDaytime': true,
      'temperature': 62,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.777777777777779},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 80},
      'windSpeed': '5 mph',
      'windDirection': 'SW',
      'icon': 'https://api.weather.gov/icons/land/day/few,0?size=small',
      'shortForecast': 'Sunny',
      'detailedForecast': '',
    },
    {
      'number': 43,
      'name': '',
      'startTime': '2024-05-10T14:00:00-07:00',
      'endTime': '2024-05-10T15:00:00-07:00',
      'isDaytime': true,
      'temperature': 62,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.222222222222221},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 79},
      'windSpeed': '15 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/day/few,0?size=small',
      'shortForecast': 'Sunny',
      'detailedForecast': '',
    },
    {
      'number': 44,
      'name': '',
      'startTime': '2024-05-10T15:00:00-07:00',
      'endTime': '2024-05-10T16:00:00-07:00',
      'isDaytime': true,
      'temperature': 62,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.777777777777779},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 80},
      'windSpeed': '15 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/day/few,0?size=small',
      'shortForecast': 'Sunny',
      'detailedForecast': '',
    },
    {
      'number': 45,
      'name': '',
      'startTime': '2024-05-10T16:00:00-07:00',
      'endTime': '2024-05-10T17:00:00-07:00',
      'isDaytime': true,
      'temperature': 61,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.222222222222221},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 81},
      'windSpeed': '15 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/day/few,0?size=small',
      'shortForecast': 'Sunny',
      'detailedForecast': '',
    },
    {
      'number': 46,
      'name': '',
      'startTime': '2024-05-10T17:00:00-07:00',
      'endTime': '2024-05-10T18:00:00-07:00',
      'isDaytime': true,
      'temperature': 60,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.666666666666666},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 82},
      'windSpeed': '20 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/day/few,0?size=small',
      'shortForecast': 'Sunny',
      'detailedForecast': '',
    },
    {
      'number': 47,
      'name': '',
      'startTime': '2024-05-10T18:00:00-07:00',
      'endTime': '2024-05-10T19:00:00-07:00',
      'isDaytime': false,
      'temperature': 60,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 11.666666666666666},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 82},
      'windSpeed': '20 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/night/few,0?size=small',
      'shortForecast': 'Mostly Clear',
      'detailedForecast': '',
    },
    {
      'number': 48,
      'name': '',
      'startTime': '2024-05-10T19:00:00-07:00',
      'endTime': '2024-05-10T20:00:00-07:00',
      'isDaytime': false,
      'temperature': 60,
      'temperatureUnit': 'F',
      'temperatureTrend': null,
      'probabilityOfPrecipitation': {'unitCode': 'wmoUnit:percent', 'value': 0},
      'dewpoint': {'unitCode': 'wmoUnit:degC', 'value': 12.222222222222221},
      'relativeHumidity': {'unitCode': 'wmoUnit:percent', 'value': 85},
      'windSpeed': '20 mph',
      'windDirection': 'WSW',
      'icon': 'https://api.weather.gov/icons/land/night/few,0?size=small',
      'shortForecast': 'Mostly Clear',
      'detailedForecast': '',
    },
  ],
};
