import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:material_symbols_icons/symbols.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:united_states_weather/fetch_weather.dart';
import 'package:united_states_weather/types/gridpoint_forecast_json_ld.dart';
import 'package:united_states_weather/pref_key.dart';
import 'package:united_states_weather/types/wind_direction.dart';
import 'package:vector_math/vector_math_64.dart';

class WindView extends StatefulWidget {
  const WindView({super.key, required this.client});

  final http.Client client;

  @override
  State<WindView> createState() => _WindViewState();
}

class _WindViewState extends State<WindView> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<GridpointForecastJsonLd> futureWeather;

  @override
  void initState() {
    super.initState();
    // TODO refactor weather fetching into helper function
    futureWeather = _prefs.then((prefs) {
      final cachedForecast = prefs.getString(PrefKey.forecastHourly.name);
      if (cachedForecast != null) {
        return Future(
          () => GridpointForecastJsonLd.fromJson(
            jsonDecode(cachedForecast) as Map<String, dynamic>,
          ),
        );
      } else {
        return fetchWeather(widget.client);
      }
    });
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
                        currentForecast.windDirection),
                    child: const Icon(Symbols.arrow_upward),
                  )
                ],
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Text(
            '${snapshot.error}',
            textAlign: TextAlign.center,
          );
        }

        // By default, show a loading spinner
        return const CircularProgressIndicator();
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
