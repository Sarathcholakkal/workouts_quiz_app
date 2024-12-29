import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/useing_abstrction/general_question.dart';

GeneralQuestion questions = GeneralQuestion();
//? it's single poing to access quesion it should be change witout change code below.
//? general Question must change to technical Question  if keep same object name here no need to change entaier code in here . this use of abstaction,
//? code break to small module  flexibility and reusebility.

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Widget> scoreBoard = [];

  int questionNumber = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questions.generalQuestionbank[questionNumber].answer;
    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreBoard.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreBoard.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      // Increment question number and wrap around using modulus
      questionNumber =
          (questionNumber + 1) % questions.generalQuestionbank.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  questions.generalQuestionbank[questionNumber].question,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              color: Colors.white,
              height: 30,
              child: Row(
                children: scoreBoard,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
