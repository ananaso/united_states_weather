// ignore_for_file: constant_identifier_names

// TODO parse in isolate for performance? https://codewithandrea.com/articles/parse-large-json-dart-isolates/
// TODO possibly replace this with a code generation strategy
class GridpointForecastJsonLd {
  // ignoring @context since it doesn't seem useful
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

  const GridpointForecastJsonLd({
    required this.geometry,
    required this.updated,
    required this.units,
    required this.forecastGenerator,
    required this.generatedAt,
    required this.updateTime,
    required this.validTimes,
    required this.elevation,
    required this.periods,
  });

  factory GridpointForecastJsonLd.fromJson(Map<String, dynamic> json) {
    final geometry = json['geometry'];
    if (geometry is! String) {
      throw FormatException(
        'Invalid JSON: required "geometry" field of type String in $json',
      );
    }

    final updated = json['updated'];
    if (updated is! String) {
      throw FormatException(
        'Invalid JSON: required "updated" field of type String in $json',
      );
    }

    final unitsRaw = json['units'];
    if (unitsRaw is! String) {
      throw FormatException(
        'Invalid JSON: required "units" field of type GridpointForecastUnits in $json',
      );
    }
    final units = GridpointForecastUnits.values.byName(unitsRaw);

    final forecastGenerator = json['forecastGenerator'];
    if (forecastGenerator is! String) {
      throw FormatException(
        'Invalid JSON: required "forecastGenerator" field of type String in $json',
      );
    }

    final generatedAt = json['generatedAt'];
    if (generatedAt is! String) {
      throw FormatException(
        'Invalid JSON: required "generatedAt" field of type String in $json',
      );
    }

    final updateTime = json['updateTime'];
    if (updateTime is! String) {
      throw FormatException(
        'Invalid JSON: required "updateTime" field of type String in $json',
      );
    }

    final validTimes = json['validTimes'];
    if (validTimes is! String) {
      throw FormatException(
        'Invalid JSON: required "validTimes" field of type String in $json',
      );
    }

    final elevationRaw = json['elevation'];
    if (elevationRaw is! Map<String, dynamic>) {
      throw FormatException(
        'Invalid JSON: required "elevation" field of type QuantitativeValue in $json',
      );
    }
    final elevation = QuantitativeValue.fromJson(elevationRaw);

    final periodsRaw = json['periods'];
    if (periodsRaw is! List<dynamic>) {
      throw FormatException(
        'Invalid JSON: required "periods" field of type List<GridpointForecastPeriod> in $json',
      );
    }
    final periods = periodsRaw
        .map(
          (period) =>
              GridpointForecastPeriod.fromJson(period as Map<String, dynamic>),
        )
        .toList();

    return GridpointForecastJsonLd(
      geometry: geometry,
      updated: updated,
      units: units,
      forecastGenerator: forecastGenerator,
      generatedAt: generatedAt,
      updateTime: updateTime,
      validTimes: validTimes,
      elevation: elevation,
      periods: periods,
    );
  }
}

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

class QuantitativeValue {
  final num? value;
  final num? maxValue;
  final num? minValue;
  // TODO use regex to make type stricter (see docs)
  final String unitCode;
  final QualityControlFlag? qualityControl;

  const QuantitativeValue({
    required this.unitCode,
    this.value,
    this.maxValue,
    this.minValue,
    this.qualityControl,
  });

  factory QuantitativeValue.fromJson(Map<String, dynamic> json) {
    final value = json['value'] as num?;
    final maxValue = json['maxValue'] as num?;
    final minValue = json['minValue'] as num?;

    final unitCode = json['unitCode'];
    if (unitCode is! String) {
      throw FormatException(
        'Invalid JSON: required "unitCode" field of type String in $json',
      );
    }

    final qualityControlRaw = json['qualityControl'];
    var qualityControl = qualityControlRaw != null
        ? QualityControlFlag.values.byName(qualityControlRaw as String)
        : null;

    return QuantitativeValue(
      unitCode: unitCode,
      value: value,
      maxValue: maxValue,
      minValue: minValue,
      qualityControl: qualityControl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'maxValue': maxValue,
      'minValue': minValue,
      'unitCode': unitCode,
      'qualityControl': qualityControl?.name,
    };
  }
}

enum GridpointForecastUnits { us, si }

enum QualityControlFlag { Z, C, S, V, X, Q, G, B, T }

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
