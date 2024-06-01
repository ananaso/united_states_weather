import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:material_symbols_icons/symbols.dart';
import 'package:united_states_weather/screens/detailed_forecast_screen.dart';
import 'package:united_states_weather/screens/weather_screen.dart';
import 'package:united_states_weather/screens/wind_screen.dart';

void main() {
  runApp(const UnitedStatesWeather());
}

// TODO is there a way to have eslint-like auto-fix capabilities for flutter/dart?

class UnitedStatesWeather extends StatelessWidget {
  const UnitedStatesWeather({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          // TODO add light/dark mode toggle in settings
          seedColor: Colors.blueGrey,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'USWeather'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // NavigationRail parameters
  int _selectedIndex = 0;
  bool showTrailing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Symbols.thermostat),
                label: Text('Forecast'),
              ),
              NavigationRailDestination(
                icon: Icon(Symbols.air),
                label: Text('Wind'),
              ),
              NavigationRailDestination(
                icon: Icon(Symbols.full_coverage),
                label: Text('Details'),
              ),
            ],
            elevation: 5,
          ),
          Expanded(
            child: switch (_selectedIndex) {
              0 => WeatherScreen(client: http.Client()),
              1 => WindScreen(client: http.Client()),
              2 => DetailedForecastScreen(client: http.Client()),
              _ => const Text(
                  "How'd you get here?",
                  textAlign: TextAlign.center,
                )
            },
          ),
        ],
      ),
    );
  }
}
