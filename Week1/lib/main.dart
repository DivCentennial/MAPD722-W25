import 'package:flutter/material.dart';

void main() {
  runApp(MyFirstWidget());
}

class MyFirstWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color.fromARGB(255, 236, 98, 88),
                  Color.fromARGB(255, 220, 103, 240),
                  Color.fromARGB(96, 73, 184, 240)
                ])),
            child: const Center(
                child: Text(
              'Hello World',
              style: TextStyle(fontSize: 28),
            ))),
      ),
    ));
  }
}
