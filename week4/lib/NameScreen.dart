import 'package:flutter/material.dart';
import 'package:week4/WelcomeScreen.dart';

class NameScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NameScreenState();
  }
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _nameController = TextEditingController();

  void _navigateToWelcomeScreen() {
    if (_nameController.text.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WelcomeScreen(_nameController.text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Your Name')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToWelcomeScreen,
              child: const Text('Go to Welcome Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
