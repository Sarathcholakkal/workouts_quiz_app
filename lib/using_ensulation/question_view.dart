import 'package:flutter/material.dart';
import 'package:quiz_app/using_ensulation/encapuslated_question.dart';

EncapuslatedQuestion questionbank = EncapuslatedQuestion();

class QuestionView extends StatefulWidget {
  const QuestionView({super.key});

  @override
  _QuestionViewState createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  List<Widget> scoreBoard = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questionbank.getAnswer();
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
    });
    questionbank.nextQuestion();
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
                  questionbank.getQuestion(),
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
                  if (questionbank.isQuestionOver()) {
                    checkAnswer(true);
                  }
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
                  if (questionbank.isQuestionOver()) {
                    checkAnswer(false);
                  }
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
