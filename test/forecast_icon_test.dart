import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:united_states_weather/forecast_icon.dart';

void main() {
  group('ForecastIcon', () {
    testWidgets('shows question_mark symbol when forecast is unhandled',
        (tester) async {
      await tester.pumpWidget(
        directionalForecastIcon(forecast: 'Clear', isDaytime: false),
      );

      final iconFinder = find.byIcon(Symbols.question_mark);

      expect(iconFinder, findsOneWidget);
    });

    group('Clear', () {
      testWidgets(
          'shows clear_day symbol when forecast is "Clear" during daytime',
          (tester) async {
        await tester.pumpWidget(
          directionalForecastIcon(forecast: 'Clear', isDaytime: true),
        );

        final iconFinder = find.byIcon(Symbols.clear_day);

        expect(iconFinder, findsOneWidget);
      });

      testWidgets(
          'shows clear_night symbol when forecast is "Clear" during nighttime',
          (tester) async {
        await tester.pumpWidget(
          directionalForecastIcon(forecast: 'Clear', isDaytime: false),
        );

        final iconFinder = find.byIcon(Symbols.clear_night);

        expect(iconFinder, findsOneWidget);
      });
    });

    group('Mostly Sunny', () {
      testWidgets(
          'shows partly_cloudy_day symbol when forecast is "Mostly Sunny" during daytime',
          (tester) async {
        await tester.pumpWidget(
          directionalForecastIcon(forecast: 'Mostly Sunny', isDaytime: true),
        );

        final iconFinder = find.byIcon(Symbols.partly_cloudy_day);

        expect(iconFinder, findsOneWidget);
      });

      testWidgets(
          'shows partly_cloudy_night symbol when forecast is "Mostly Sunny" during nighttime',
          (tester) async {
        await tester.pumpWidget(
          directionalForecastIcon(forecast: 'Mostly Sunny', isDaytime: false),
        );

        final iconFinder = find.byIcon(Symbols.partly_cloudy_night);

        expect(iconFinder, findsOneWidget);
      });
    });

    group('Partly Cloudy', () {
      testWidgets(
          'shows partly_cloudy_day symbol when forecast is "Partly Cloudy" during daytime',
          (tester) async {
        await tester.pumpWidget(
          directionalForecastIcon(forecast: 'Partly Cloudy', isDaytime: true),
        );

        final iconFinder = find.byIcon(Symbols.partly_cloudy_day);

        expect(iconFinder, findsOneWidget);
      });

      testWidgets(
          'shows partly_cloudy_night symbol when forecast is "Partly Cloudy" during nighttime',
          (tester) async {
        await tester.pumpWidget(
          directionalForecastIcon(forecast: 'Partly Cloudy', isDaytime: false),
        );

        final iconFinder = find.byIcon(Symbols.partly_cloudy_night);

        expect(iconFinder, findsOneWidget);
      });
    });

    testWidgets('shows cloudy symbol when forecast is "Cloudy"',
        (tester) async {
      await tester.pumpWidget(
        directionalForecastIcon(forecast: 'Cloudy'),
      );

      final iconFinder = find.byIcon(Symbols.cloudy);

      expect(iconFinder, findsOneWidget);
    });

    testWidgets('shows sunny symbol when forecast is "Sunny"', (tester) async {
      await tester.pumpWidget(
        directionalForecastIcon(forecast: 'Sunny'),
      );

      final iconFinder = find.byIcon(Symbols.sunny);

      expect(iconFinder, findsOneWidget);
    });

    testWidgets(
        'shows partly_cloudy_night symbol when forecast is "Mostly Clear"',
        (tester) async {
      await tester.pumpWidget(
        directionalForecastIcon(forecast: 'Mostly Clear', isDaytime: false),
      );

      final iconFinder = find.byIcon(Symbols.partly_cloudy_night);

      expect(iconFinder, findsOneWidget);
    });

    testWidgets(
        'shows partly_cloudy_night symbol when forecast is "Mostly Clear"',
        (tester) async {
      await tester.pumpWidget(
        directionalForecastIcon(forecast: 'Mostly Clear', isDaytime: false),
      );

      final iconFinder = find.byIcon(Symbols.partly_cloudy_night);

      expect(iconFinder, findsOneWidget);
    });
  });
}

Widget directionalForecastIcon({
  required String forecast,
  bool isDaytime = true,
}) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: ForecastIcon(
      forecast: forecast,
      isDaytime: isDaytime,
    ),
  );
}

// 'shows clear_night symbol when forecast is "Clear" and is not daytime'
