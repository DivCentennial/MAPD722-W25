import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  @override
  State<ThirdScreen> createState() {
    return _ThirdScreenState();
  }
}

class _ThirdScreenState extends State<ThirdScreen> {
  final TextEditingController _valueController = TextEditingController();

  void _sendDataBack() {
    if (_valueController.text.isNotEmpty) {
      Navigator.pop(context, _valueController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter a Value')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _valueController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a value',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendDataBack,
              child: const Text('Send Value Back'),
            ),
          ],
        ),
      ),
    );
  }
}
