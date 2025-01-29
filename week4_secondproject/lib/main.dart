import 'package:flutter/material.dart';
import 'package:week4_secondproject/CalculatorScreen.dart';
import 'package:week4_secondproject/HistoryScreen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainAppState();
  }
}

class _MainAppState extends State<MainApp> {
  List<Widget> _screens = [];
  List<String> history = [];

  @override
  void initState() {
    super.initState();
    _screens
        .addAll([CalculatorScreen(_onUpdateHistory), HistoryScreen(history)]);
  }

  void _onUpdateHistory(newItem) {
    setState(() {
      history.add(newItem);
    });
  }

  int _selecteeIndex = 0;
  void _onTap(int newIndex) {
    setState(() {
      _selecteeIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.calculate), label: 'Calculator'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: 'History')
            ],
            currentIndex: _selecteeIndex,
            onTap: (value) => _onTap(value),
          ),
          body: _screens[_selecteeIndex]),
    );
  }
}
