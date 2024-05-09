import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:material_symbols_icons/symbols.dart';
import 'package:united_states_weather/fetch_weather.dart';
import 'package:united_states_weather/gridpoint_forecast_json_ld.dart';

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
          final currentForecast = snapshot.data!.periods
              .firstWhere((element) => element.number == 1);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${currentForecast.temperature} °${currentForecast.temperatureUnit}',
                style: const TextStyle(fontSize: 32),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 20,
                    child: currentForecast.isDaytime
                        ? const Icon(Symbols.clear_day)
                        : const Icon(Symbols.clear_night),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Flexible(
                    flex: 20,
                    child: Text(
                      currentForecast.shortForecast,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner
        return const CircularProgressIndicator();
      },
    );
  }
}
