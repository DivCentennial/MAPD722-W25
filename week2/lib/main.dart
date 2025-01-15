import 'package:flutter/material.dart';

void main() {
  runApp(DieRollApp());
}

class DieRollApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Roll a Die App'),
        ),
        body: Center(
            child: Column(
          children: [
            const Text(
              'Roll a Die',
              style: TextStyle(
                  fontSize: 24, color: Color.fromARGB(255, 21, 146, 223)),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset('', width: 150, height: 159)
          ],
        )),
      ),
    );
  }
}
