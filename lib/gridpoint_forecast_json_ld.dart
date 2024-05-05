// ignore_for_file: constant_identifier_names

// TODO parse in isolate for performance? https://codewithandrea.com/articles/parse-large-json-dart-isolates/
// TODO possibly replace this with a code generation strategy
class GridpointForecastJsonLd {
  // TODO figure out how to shape a "JsonLdContext" class
  final List<Object> context;
  // TODO maybe do something with "Well-known Text" format?
  final String geometry;
  // TODO try parsing this and other times directly into DateTimes?
  final String updated; // deprecated in favor of updateTime
  final GridpointForecastUnits units;
  final String forecastGenerator;
  final String generatedAt;
  final String updateTime;
  // TODO consider using https://pub.dev/packages/iso8601_duration to parse
  final String validTimes;
  final QuantitativeValue elevation;
  final List<GridpointForecastPeriod> periods;

  const GridpointForecastJsonLd(
    this.context,
    this.geometry,
    this.updated,
    this.units,
    this.forecastGenerator,
    this.generatedAt,
    this.updateTime,
    this.validTimes,
    this.elevation,
    this.periods,
  );

  factory GridpointForecastJsonLd.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        '@context': List<Object> context,
        'geometry': String geometry,
        'updated': String updated,
        'units': GridpointForecastUnits units,
        'forecastGenerator': String forecastGenerator,
        'generatedAt': String generatedAt,
        'updateTime': String updateTime,
        'validTimes': String validTimes,
        'elevation': QuantitativeValue elevation,
        'periods': List<GridpointForecastPeriod> periods,
      } =>
        GridpointForecastJsonLd(
          context,
          geometry,
          updated,
          units,
          forecastGenerator,
          generatedAt,
          updateTime,
          validTimes,
          elevation,
          periods,
        ),
      _ => throw const FormatException('Failed to serialize weather.'),
    };
  }
}

enum GridpointForecastUnits { us, si }

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
  final String? unitCode;
  final QualityControlFlag? qualityControl;

  const QuantitativeValue([
    this.unitCode,
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
