import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:united_states_weather/fetch_weather.dart';

class FutureWeather extends StatefulWidget {
  const FutureWeather({super.key, required this.client});

  final http.Client client;

  @override
  State<FutureWeather> createState() => _FutureWeatherState();
}

class _FutureWeatherState extends State<FutureWeather> {
  late Future<GridpointForecastJsonLd> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather(widget.client);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureWeather,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('${snapshot.data!.periods[0].temperature}'
              ' °'
              '${snapshot.data!.periods[0].temperatureUnit}');
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner
        return const CircularProgressIndicator();
      },
    );
  }
}
