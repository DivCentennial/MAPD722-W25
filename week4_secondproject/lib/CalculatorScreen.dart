import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  final Function(String) updateHistory;

  const CalculatorScreen({super.key, required this.updateHistory});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = "";
  String result = "";

  void calculate() {
    try {
      result = (double.parse(input)).toString();
      widget.updateHistory("$input = $result");
      setState(() {});
    } catch (e) {
      result = "Error";
    }
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
            onPressed: calculate,
            child: const Text('Calculate'),
          ),
          const SizedBox(height: 20),
          Text('Result: $result', style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
