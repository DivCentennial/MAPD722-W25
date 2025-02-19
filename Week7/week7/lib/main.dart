import 'package:flutter/material.dart';
import 'package:week7/ImagesScreen.dart';
import 'package:week7/VideoScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ImagesScreen(),
        ),
      ),
    );
  }
}
