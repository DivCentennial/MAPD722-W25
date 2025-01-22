import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final VoidCallback clickHandler;
  final List<String> answers;
  final int _index;

  const Answer(this.answerText, this.clickHandler, this.answers, this._index);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              clickHandler();
              answers[_index] = answerText;
            },
            child: Text(answerText)));
  }
}
