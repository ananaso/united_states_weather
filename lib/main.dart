import 'package:flutter/material.dart';
import 'package:united_states_weather/fetch_weather.dart';

void main() {
  runApp(const UnitedStatesWeather());
}

class UnitedStatesWeather extends StatelessWidget {
  const UnitedStatesWeather({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  late Future<GridpointForecastJsonLd> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: futureWeather,
          builder: (
            BuildContext context,
            AsyncSnapshot<GridpointForecastJsonLd> snapshot,
          ) {
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
        ),
      ),
    );
  }
}
