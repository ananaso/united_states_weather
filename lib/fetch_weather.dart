// TODO remove this rule after moving Gridpoint stuff to new file
// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;

Future<GridpointForecastJsonLd> fetchWeather(http.Client client) async {
  final http.Response response = await client
      .get(Uri.parse('https://api.weather.gov/gridpoints/LOX/148,36/forecast'));

  if (response.statusCode == 200) {
    return GridpointForecastJsonLd.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  } else {
    throw Exception('Failed to load weather data');
  }
}

// TODO replace this with a code generation strategy to simplify
class GridpointForecastJsonLd {
  final List<GridpointForecastPeriod> periods;

  const GridpointForecastJsonLd(this.periods);

  factory GridpointForecastJsonLd.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'periods': List<GridpointForecastPeriod> periods,
      } =>
        GridpointForecastJsonLd(periods),
      _ => throw const FormatException('Failed to serialize weather.'),
    };
  }
}

class GridpointForecastPeriod {
  int number;
  String name;
  String startTime;
  String endTime;
  bool isDaytime;
  // TODO update to 'forecast_temperature_qv' format
  int temperature;
  String temperatureUnit;
  String? temperatureTrend;
  QuantitativeValue probabilityOfPrecipitation;
  QuantitativeValue dewpoint;
  QuantitativeValue relativeHumidity;
  // TODO update to 'forecast_wind_speed_qv' format
  String windSpeed;
  // TODO update to 'forecast_wind_speed_qv' format
  String? windGust;
  String windDirection;
  String? icon; // deprecated
  String shortForecast;
  String detailedForecast;

  GridpointForecastPeriod(
    this.number,
    this.name,
    this.startTime,
    this.endTime,
    this.isDaytime,
    this.temperature,
    this.temperatureUnit,
    this.probabilityOfPrecipitation,
    this.dewpoint,
    this.relativeHumidity,
    this.windSpeed,
    this.windDirection,
    this.shortForecast,
    this.detailedForecast, [
    this.temperatureTrend,
    this.windGust,
    this.icon,
  ]);
}

class QuantitativeValue {
  final num? value;
  final num? maxValue;
  final num? minValue;
  // TODO use regex to make type stricter (see docs)
  final String unitCode;
  final QualityControlFlag? qualityControl;

  const QuantitativeValue(
    this.unitCode, [
    this.value,
    this.maxValue,
    this.minValue,
    this.qualityControl,
  ]);
}

enum WindDirection {
  N,
  NNE,
  NE,
  ENE,
  E,
  ESE,
  SE,
  SSE,
  S,
  SSW,
  SW,
  WSW,
  W,
  WNW,
  NW,
  NNW
}

enum QualityControlFlag { Z, C, S, V, X, Q, G, B, T }
