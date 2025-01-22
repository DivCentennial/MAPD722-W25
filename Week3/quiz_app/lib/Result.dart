import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final List<String> answers;
  final VoidCallback restartHandler;

  Result(this.questions, this.answers, this.restartHandler);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      questions[index]['questionText'] as String,
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      answers[index],
                      style: const TextStyle(fontSize: 10),
                    )
                  ]),
            );
          },
        )),
        ElevatedButton(
            onPressed: restartHandler, child: const Text('Restart The Quiz'))
      ],
    );
  }
}
