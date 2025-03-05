import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week8/ValueProvider.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
          Consumer<ValueProvider>(builder: (context, valueprovider, child) {
        return Text(
          'The Value is ${valueprovider.value}',
          style: const TextStyle(fontSize: 30),
        );
      })),
    );
  }
}
