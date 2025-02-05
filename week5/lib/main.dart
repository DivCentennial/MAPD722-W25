import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:week5/screens/CategoryScreen.dart';
import './l10n/app_localizations.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      localizationsDelegates: [
        AppLocalizations.delegate, // Generated class
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Scaffold(body: CategoryScreen()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(lang!.title)),
      body: Center(child: Text(lang.meals)),
    );
  }
}
