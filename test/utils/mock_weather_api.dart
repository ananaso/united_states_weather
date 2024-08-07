import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../fixtures/fetch_weather_request.dart';
import '../fixtures/weather_gov_forecast_error_json.dart';
import '../fixtures/weather_gov_forecast_hourly_response_json.dart';

PostExpectation<Future<http.Response>> mockWeatherApi({
  required http.Client client,
  Map<String, Object>? initialCache,
  bool? returnError = false,
}) {
  SharedPreferences.setMockInitialValues(initialCache ?? {});

  final mockedApi = when(
    client.get(
      mockUri,
      headers: mockHeaders,
    ),
  );

  mockedApi.thenAnswer(
    (_) async => returnError == true
        ? http.Response(weatherGovForecastErrorJson, 500)
        : http.Response(weatherGovForecastHourlyResponseJson, 200),
  );
  return mockedApi;
}

Future<void> renderWeatherData(WidgetTester tester) async {
  await tester.pumpAndSettle(
    Durations.short1,
    EnginePhase.build,
    Durations.short2,
  );
}
