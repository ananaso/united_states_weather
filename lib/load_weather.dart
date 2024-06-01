import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:united_states_weather/types/gridpoint_forecast_json_ld.dart';
import 'package:united_states_weather/pref_key.dart';

Future<GridpointForecastJsonLd> loadWeather(
  SharedPreferences prefs,
  http.Client client,
) {
  final cachedForecast = prefs.getString(PrefKey.forecastHourly.name);
  final cacheExpiration = prefs.getInt(PrefKey.cacheExpiration.name);
  if (cachedForecast != null &&
      cacheExpiration != null &&
      DateTime.fromMillisecondsSinceEpoch(cacheExpiration, isUtc: true)
          .isAfter(DateTime.timestamp())) {
    final forecast = GridpointForecastJsonLd.fromJson(
      jsonDecode(cachedForecast) as Map<String, dynamic>,
    );
    return Future(
      () => forecast,
    );
  } else {
    return fetchWeather(client);
  }
}

// TODO Figure out a better way to inject/mock the client when testing
Future<GridpointForecastJsonLd> fetchWeather(http.Client client) async {
  print('fetching weather');
  final http.Response response = await client.get(
    Uri.parse('https://api.weather.gov/gridpoints/LOX/148,36/forecast/hourly'),
    headers: {
      'Accept': 'application/ld+json',
      'User-Agent': '(USWeather, usweather.amulet712@simplelogin.com)',
    },
  );

  if (response.statusCode == 200) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final int cacheExpirationTimestamp =
        _calculateCacheExpireTime(response.headers['cache-control']);
    final String forecastHourly = response.body;

    await prefs.setInt(PrefKey.cacheExpiration.name, cacheExpirationTimestamp);
    await prefs.setString(PrefKey.forecastHourly.name, forecastHourly);

    return GridpointForecastJsonLd.fromJson(
      jsonDecode(forecastHourly) as Map<String, dynamic>,
    );
  } else {
    // TODO instead of throwing load cache with "stale" notice in UI
    throw Exception('Failed to load weather data');
  }
}

int _calculateCacheExpireTime(String? cacheControlHeader) {
  final maxAgeRegex = RegExp(r'(?<=max-age=)\d+');
  final maxAgeString =
      maxAgeRegex.firstMatch(cacheControlHeader ?? '')?[0] ?? '';
  final maxAge = int.tryParse(maxAgeString) ?? 1800;

  final currentTime = DateTime.timestamp();
  final cacheExpirationTime = currentTime.add(Duration(seconds: maxAge));

  return cacheExpirationTime.millisecondsSinceEpoch;
}
