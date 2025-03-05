import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week8/ValueProvider.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void add() {
      Provider.of<ValueProvider>(context, listen: false).increment();
    }

    void sub() {
      Provider.of<ValueProvider>(context, listen: false).decrement();
    }

    void setToZero() {
      Provider.of<ValueProvider>(context, listen: false).setToZero();
    }

    void goToSecond() {
      Navigator.of(context).pushNamed('/second');
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Consumer<ValueProvider>(builder: (context, valueprovider, child) {
              return Text(
                'The Value is ${valueprovider.value}',
                style: const TextStyle(fontSize: 30),
              );
            }),
            ElevatedButton(
                onPressed: add,
                child: const Text("++", style: TextStyle(fontSize: 20))),
            ElevatedButton(
                onPressed: sub,
                child: const Text("--", style: TextStyle(fontSize: 20))),
            ElevatedButton(
                onPressed: setToZero,
                child:
                    const Text("Set To Zero", style: TextStyle(fontSize: 20))),
            ElevatedButton(
                onPressed: goToSecond,
                child:
                    const Text("Go To Second", style: TextStyle(fontSize: 20))),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
