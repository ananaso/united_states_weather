// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:material_symbols_icons/symbols.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:united_states_weather/future_weather.dart';

import 'fixtures/fetch_weather_request.dart';
import 'fixtures/weather_gov_forecast_hourly_response_json.dart';
import 'mocks/future_weater_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets('Displays current temperature with unit', (widgetTester) async {
    final client = MockClient();

    when(
      client.get(
        mockUri,
        headers: mockHeaders,
      ),
    ).thenAnswer(
      (_) async => http.Response(weatherGovForecastHourlyResponseJson, 200),
    );

    // Build our app and trigger a frame.
    await widgetTester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: FutureWeather(
          client: client,
        ),
      ),
    );

    await widgetTester.pumpAndSettle(
      Durations.short1,
      EnginePhase.build,
      Durations.short2,
    );

    expect(find.text('63 °F'), findsOneWidget);
  });

  testWidgets('Displays current status as text with icon',
      (widgetTester) async {
    final client = MockClient();

    when(
      client.get(
        mockUri,
        headers: mockHeaders,
      ),
    ).thenAnswer(
      (_) async => http.Response(weatherGovForecastHourlyResponseJson, 200),
    );

    // Build our app and trigger a frame.
    await widgetTester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: FutureWeather(
          client: client,
        ),
      ),
    );

    await widgetTester.pumpAndSettle(
      Durations.short1,
      EnginePhase.build,
      Durations.short2,
    );

    expect(find.text('Clear'), findsOneWidget);
    expect(find.byIcon(Symbols.clear_night), findsNothing);
  });
}
