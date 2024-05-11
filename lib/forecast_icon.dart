import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class ForecastIcon extends StatelessWidget {
  const ForecastIcon({
    super.key,
    required this.forecast,
    required this.isDaytime,
  });

  final String forecast;
  final bool isDaytime;

  // TODO don't rely on shortForecast: https://github.com/weather-gov/api/discussions/453#discussioncomment-1224307
  // 	perhaps instead us these observation properties: https://github.com/weather-gov/api/discussions/453#discussioncomment-2768919

  @override
  Widget build(BuildContext context) {
    return Icon(
      switch (forecast) {
        'Clear' => isDaytime ? Symbols.clear_day : Symbols.clear_night,
        'Mostly Sunny' ||
        'Mostly Clear' ||
        'Partly Cloudy' =>
          isDaytime ? Symbols.partly_cloudy_day : Symbols.partly_cloudy_night,
        'Cloudy' => Symbols.cloudy,
        'Sunny' => Symbols.sunny,
        _ => Symbols.question_mark,
      },
    );
  }
}
