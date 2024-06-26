import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:material_symbols_icons/symbols.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:united_states_weather/load_weather.dart' show loadWeather;
import 'package:united_states_weather/types/gridpoint_forecast_json_ld.dart';
import 'package:united_states_weather/types/wind_direction.dart';
import 'package:vector_math/vector_math_64.dart';

class WindScreen extends StatefulWidget {
  const WindScreen({super.key, required this.client});

  final http.Client client;

  @override
  State<WindScreen> createState() => _WindScreenState();
}

class _WindScreenState extends State<WindScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<GridpointForecastJsonLd> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = _prefs.then((prefs) => loadWeather(prefs, widget.client));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureWeather,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final currentForecast = snapshot.data!.periods
              .firstWhere((element) => element.number == 1);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentForecast.windSpeed,
                style: const TextStyle(fontSize: 32),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentForecast.windDirection,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Transform.rotate(
                    angle: compassDirectionToRadians(
                      currentForecast.windDirection,
                    ),
                    child: const Icon(Symbols.arrow_upward),
                  ),
                ],
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text(
            '${snapshot.error}',
            textAlign: TextAlign.center,
          );
        }

        // By default, show a loading spinner
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

double compassDirectionToRadians(String compassDirection) {
  final direction = WindDirection.values.byName(compassDirection);
  final double degrees;
  switch (direction) {
    case WindDirection.N:
      degrees = 0;
    case WindDirection.NNE:
      degrees = 22.5;
    case WindDirection.NE:
      degrees = 45;
    case WindDirection.ENE:
      degrees = 67.5;
    case WindDirection.E:
      degrees = 90;
    case WindDirection.ESE:
      degrees = 112.5;
    case WindDirection.SE:
      degrees = 135;
    case WindDirection.SSE:
      degrees = 157.5;
    case WindDirection.S:
      degrees = 180;
    case WindDirection.SSW:
      degrees = 202.5;
    case WindDirection.SW:
      degrees = 225;
    case WindDirection.WSW:
      degrees = 247.5;
    case WindDirection.W:
      degrees = 270;
    case WindDirection.WNW:
      degrees = 292.5;
    case WindDirection.NW:
      degrees = 315;
    case WindDirection.NNW:
      degrees = 337.5;
    default:
      throw UnimplementedError('Unexpected wind direction: $compassDirection');
  }
  return radians(degrees);
}
