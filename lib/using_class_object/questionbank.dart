import 'package:flutter/material.dart';
import 'package:quiz_app/using_class_object/question_class.dart';

class Questionbank extends StatefulWidget {
  const Questionbank({super.key});

  @override
  _QuestionbankState createState() => _QuestionbankState();
}

class _QuestionbankState extends State<Questionbank> {
  List<Widget> scoreBoard = [];
  List<QuestionClass> questionbank = [
    QuestionClass(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    QuestionClass(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    QuestionClass(question: 'A slug\'s blood is green.', answer: true)
  ];

  int questionNumber = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questionbank[questionNumber].answer;
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
      questionNumber = (questionNumber + 1) % questionbank.length;
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
                  questionbank[questionNumber].question,
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
          Row(
            children: scoreBoard,
          ),
        ],
      ),
    );
  }
}
