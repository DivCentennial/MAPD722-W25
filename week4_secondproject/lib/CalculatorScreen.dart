import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  final Function _updateHistory;

  const CalculatorScreen(this._updateHistory, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _CalculatorScreenState();
  }
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = "";
  String result = "";
  void _calculate() {
    widget._updateHistory(result);
    setState(() {
      result = input;
      // I can't add new item to the history array
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a number'),
              onChanged: (value) {
                input = value;
              },
            ),
          ),
          ElevatedButton(
            onPressed: _calculate,
            child: const Text('Calculate'),
          ),
          const SizedBox(height: 20),
          Text('Result: $result', style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
