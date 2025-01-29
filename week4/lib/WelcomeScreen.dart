import 'package:flutter/material.dart';
import 'package:week4/ThirdScreen.dart';

class WelcomeScreen extends StatefulWidget {
  final String nameFromNameScreen;
  const WelcomeScreen(this.nameFromNameScreen);

  @override
  State<WelcomeScreen> createState() {
    return _WelcomeScreenState();
  }
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String receviedValue = "";

  void _navigateToThirdScreen() async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: ((context) => ThirdScreen())));

    if (result != null) {
      // getting this result and update the widget
      setState(() {
        receviedValue = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome  Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome ${widget.nameFromNameScreen}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToThirdScreen,
              child: const Text('Go to Third Screen'),
            ),
            const SizedBox(height: 20),
            Text(
              'Received Value: $receviedValue',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
