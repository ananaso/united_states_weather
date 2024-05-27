import 'package:united_states_weather/types/quantitative_value.dart';

class GridpointForecastPeriod {
  // TODO review these for what's nullable and what's not
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
  String icon; // deprecated
  String shortForecast;
  String detailedForecast;

  GridpointForecastPeriod({
    required this.number,
    required this.name,
    required this.startTime,
    required this.endTime,
    required this.isDaytime,
    required this.temperature,
    required this.temperatureUnit,
    this.temperatureTrend,
    required this.probabilityOfPrecipitation,
    required this.dewpoint,
    required this.relativeHumidity,
    required this.windSpeed,
    this.windGust,
    required this.windDirection,
    required this.icon,
    required this.shortForecast,
    required this.detailedForecast,
  });

  factory GridpointForecastPeriod.fromJson(Map<String, dynamic> json) {
    final number = json['number'];
    if (number is! int) {
      throw FormatException(
        'Invalid JSON: required "number" field of type int in $json',
      );
    }

    final name = json['name'];
    if (name is! String) {
      throw FormatException(
        'Invalid JSON: required "name" field of type String in $json',
      );
    }

    final startTime = json['startTime'];
    if (startTime is! String) {
      throw FormatException(
        'Invalid JSON: required "startTime" field of type String in $json',
      );
    }

    final endTime = json['endTime'];
    if (endTime is! String) {
      throw FormatException(
        'Invalid JSON: required "endTime" field of type String in $json',
      );
    }

    final isDaytime = json['isDaytime'];
    if (isDaytime is! bool) {
      throw FormatException(
        'Invalid JSON: required "isDaytime" field of type bool in $json',
      );
    }

    final temperature = json['temperature'];
    if (temperature is! int) {
      throw FormatException(
        'Invalid JSON: required "temperature" field of type int in $json',
      );
    }

    final temperatureUnit = json['temperatureUnit'];
    if (temperatureUnit is! String) {
      throw FormatException(
        'Invalid JSON: required "temperatureUnit" field of type String in $json',
      );
    }

    final temperatureTrend = json['temperatureTrend'] as String?;

    final probabilityOfPrecipitationRaw = json['probabilityOfPrecipitation'];
    final probabilityOfPrecipitation = probabilityOfPrecipitationRaw != null
        ? QuantitativeValue.fromJson(
            probabilityOfPrecipitationRaw as Map<String, dynamic>,
          )
        : throw FormatException(
            'Invalid JSON: required "probabilityOfPrecipitation" field of type QuantitativeValue in $json',
          );

    final dewpointRaw = json['dewpoint'];
    final dewpoint = dewpointRaw != null
        ? QuantitativeValue.fromJson(dewpointRaw as Map<String, dynamic>)
        : throw FormatException(
            'Invalid JSON: required "dewpoint" field of type QuantitativeValue in $json',
          );

    final relativeHumidityRaw = json['relativeHumidity'];
    final relativeHumidity = relativeHumidityRaw != null
        ? QuantitativeValue.fromJson(
            relativeHumidityRaw as Map<String, dynamic>,
          )
        : throw FormatException(
            'Invalid JSON: required "relativeHumidity" field of type QuantitativeValue in $json',
          );

    final windSpeed = json['windSpeed'];
    if (windSpeed is! String) {
      throw FormatException(
        'Invalid JSON: required "windSpeed" field of type String in $json',
      );
    }

    final windGust = json['windGust'] as String?;

    final windDirection = json['windDirection'];
    if (windDirection is! String) {
      throw FormatException(
        'Invalid JSON: required "windDirection" field of type String in $json',
      );
    }

    final icon = json['icon'];
    if (icon is! String) {
      throw FormatException(
        'Invalid JSON: required "icon" field of type String in $json',
      );
    }

    final shortForecast = json['shortForecast'];
    if (shortForecast is! String) {
      throw FormatException(
        'Invalid JSON: required "shortForecast" field of type String in $json',
      );
    }

    final detailedForecast = json['detailedForecast'];
    if (detailedForecast is! String) {
      throw FormatException(
        'Invalid JSON: required "detailedForecast" field of type String in $json',
      );
    }

    return GridpointForecastPeriod(
      number: number,
      name: name,
      startTime: startTime,
      endTime: endTime,
      isDaytime: isDaytime,
      temperature: temperature,
      temperatureUnit: temperatureUnit,
      temperatureTrend: temperatureTrend,
      probabilityOfPrecipitation: probabilityOfPrecipitation,
      dewpoint: dewpoint,
      relativeHumidity: relativeHumidity,
      windSpeed: windSpeed,
      windGust: windGust,
      windDirection: windDirection,
      icon: icon,
      shortForecast: shortForecast,
      detailedForecast: detailedForecast,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'name': name,
      'startTime': startTime,
      'endTime': endTime,
      'isDaytime': isDaytime,
      'temperature': temperature,
      'temperatureUnit': temperatureUnit,
      'temperatureTrend': temperatureTrend,
      'probabilityOfPrecipitation': probabilityOfPrecipitation.toJson(),
      'dewpoint': dewpoint.toJson(),
      'relativeHumidity': relativeHumidity.toJson(),
      'windSpeed': windSpeed,
      'windGust': windGust,
      'windDirection': windDirection,
      'icon': icon,
      'shortForecast': shortForecast,
      'detailedForecast': detailedForecast,
    };
  }
}
