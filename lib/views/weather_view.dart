import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:united_states_weather/fetch_weather.dart';
import 'package:united_states_weather/types/gridpoint_forecast_json_ld.dart';
import 'package:united_states_weather/pref_key.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key, required this.client});

  final http.Client client;

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<GridpointForecastJsonLd> futureWeather;

  @override
  void initState() {
    super.initState();
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
                '${currentForecast.temperature} °${currentForecast.temperatureUnit}',
                style: const TextStyle(fontSize: 32),
              ),
              Text(
                currentForecast.shortForecast,
                style: const TextStyle(fontSize: 18),
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
        return const CircularProgressIndicator();
      },
    );
  }
}
