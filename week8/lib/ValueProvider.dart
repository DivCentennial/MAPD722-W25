import 'package:flutter/material.dart';

class ValueProvider extends ChangeNotifier {
  int _value = 0; // app state
  int get value => _value;
  void increment() {
    _value += 1;
    notifyListeners();
  }

  void decrement() {
    _value -= 1;
    notifyListeners();
  }

  void setToZero() {
    _value = 0;
    notifyListeners();
  }
}
