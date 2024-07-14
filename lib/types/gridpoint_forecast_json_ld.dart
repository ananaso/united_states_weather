import 'package:united_states_weather/types/gridpoint_forecast_period.dart';
import 'package:united_states_weather/types/gridpoint_forecast_units.dart';
import 'package:united_states_weather/types/quantitative_value.dart';

// TODO parse in isolate for performance? https://codewithandrea.com/articles/parse-large-json-dart-isolates/
// TODO possibly replace this with a code generation strategy
class GridpointForecastJsonLd {
  // ignoring @context since it doesn't seem useful
  // TODO maybe do something with "Well-known Text" format?
  final String geometry;
  // TODO try parsing this and other times directly into DateTimes?
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
