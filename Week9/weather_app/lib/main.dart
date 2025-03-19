import 'package:flutter/material.dart';
import 'package:weather_app/MainMenuScreen.dart';
import 'package:weather_app/SearchScreen.dart';
import 'package:weather_app/WeatherScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      routes: {
        '/': (context) => MainMenuScreen(),
        '/search': (context) => SearchScreen(),
        '/weather': (context) => WeatherScreen()
      },
    );
  }
}
