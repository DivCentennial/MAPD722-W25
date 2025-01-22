import 'package:flutter/material.dart';
import 'package:quiz_app/Answer.dart';
import 'package:quiz_app/Question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int _index;
  final List<String> answers;
  final VoidCallback answerClickHandler;
  Quiz(this.questions, this._index, this.answers, this.answerClickHandler);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[_index]['questionText'] as String),
        ...(questions[_index]['answers'] as List<String>).map(
          (answer) {
            return Answer(answer, answerClickHandler, answers, _index);
          },
        ).toList()
      ],
    );
  }
}
