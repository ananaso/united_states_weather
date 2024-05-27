// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:united_states_weather/views/weather_view.dart';
import 'package:http/http.dart' as http;
import 'package:united_states_weather/main.dart';

import 'mocks/main_test.mocks.dart';
import 'utils/mock_weather_api.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets(
    'Defaults to Current Weather page',
    (WidgetTester tester) async {
      final client = MockClient();

      mockWeatherApi(client: client);

      // Build our app and trigger a frame.
      await tester.pumpWidget(const UnitedStatesWeather());

      await renderWeatherData(tester);

      final elementFinder = find.byElementType(WeatherView);

      expect(elementFinder, findsOneWidget);
    },
    // skip until possible we separate out the "homepage" into its own widget.
    // don't want to build a client parameter into the page just for testing
    skip: true,
  );

  // testWidgets('Displays current temperature with unit',
  //     (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const UnitedStatesWeather());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
