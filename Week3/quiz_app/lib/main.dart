import 'package:flutter/material.dart';
import 'package:quiz_app/Quiz.dart';
import 'package:quiz_app/Result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _index = 0;
  var answers = ['', '', ''];
  var questions = [
    {
      'questionText': 'What is your favourite color?',
      'answers': ['Black', 'Red', 'Blue', 'Green']
    },
    {
      'questionText': 'What is your favourite animal?',
      'answers': ['Cat', 'Dog', 'Rabbit', 'Lion']
    },
    {
      'questionText': 'What is your favourite city?',
      'answers': ['Toronto', 'NewYork', 'Paris', 'Rome']
    }
  ];

  void _onAnswerClicked() {
    setState(() {
      _index += 1;
    });
  }

  void _onRestartClicked() {
    setState(() {
      _index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Quiz App')),
          body: _index < questions.length
              ? Quiz(questions, _index, answers, _onAnswerClicked)
              : Result(questions, answers, _onRestartClicked)),
    );
  }
}
