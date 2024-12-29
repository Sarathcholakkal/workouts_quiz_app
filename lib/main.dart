import 'package:flutter/material.dart';
import 'package:quiz_app/using_ensulation/question_view.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuestionView()
              // QuestionPage()
              //  Questionbank(),
              ),
        ),
      ),
    );
  }
}
