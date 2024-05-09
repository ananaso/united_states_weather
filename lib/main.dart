import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:united_states_weather/future_weather.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: FutureWeather(client: http.Client())),
    );
  }
}
