import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:united_states_weather/gridpoint_forecast_json_ld.dart';
import 'package:united_states_weather/pref_key.dart';

// TODO Figure out a better way to inject/mock the client when testing
Future<GridpointForecastJsonLd> fetchWeather(http.Client client) async {
  final http.Response response = await client.get(
    Uri.parse('https://api.weather.gov/gridpoints/LOX/148,36/forecast/hourly'),
    headers: {
      'Accept': 'application/ld+json',
      'User-Agent': '(USWeather, usweather.amulet712@simplelogin.com)',
    },
  );

  if (response.statusCode == 200) {
    final maxAgeRegex = RegExp(r'(?<=max-age=)\d+');
    final maxAgeString =
        maxAgeRegex.firstMatch(response.headers['cache-control'] ?? '')?[0] ??
            '';
    final maxAge = int.tryParse(maxAgeString) ?? 1800;

    final forecastHourly = response.body;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(PrefKey.maxAge.name, maxAge);
    await prefs.setString(PrefKey.forecastHourly.name, forecastHourly);

    return GridpointForecastJsonLd.fromJson(
      jsonDecode(forecastHourly) as Map<String, dynamic>,
    );
  } else {
    throw Exception('Failed to load weather data');
  }
}
