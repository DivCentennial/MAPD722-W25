import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week8/FirstScreen.dart';
import 'package:week8/SecondScreen.dart';
import 'package:week8/ValueProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ValueProvider(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Packege',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => SecondScreen()
      },
    );
  }
}
