import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:united_states_weather/gridpoint_forecast_json_ld.dart';

Future<GridpointForecastJsonLd> fetchWeather(http.Client client) async {
  final http.Response response = await client.get(
    Uri.parse('https://api.weather.gov/gridpoints/LOX/148,36/forecast/hourly'),
    headers: {
      'Accept': 'application/ld+json',
      'User-Agent': '(USWeather, usweather.amulet712@simplelogin.com)'
    },
  );

  if (response.statusCode == 200) {
    return GridpointForecastJsonLd.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  } else {
    throw Exception('Failed to load weather data');
  }
}
