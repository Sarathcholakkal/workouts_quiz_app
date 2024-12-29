import 'package:quiz_app/useing_abstrction/general_question_class.dart';

class EncapuslatedQuestion {
  int _questionNumber = 0;
  List<GeneralQuestionClass> _generalQuestionbank = [
    GeneralQuestionClass('Some cats are actually allergic to humans', true),
    GeneralQuestionClass(
        'You can lead a cow down stairs but not up stairs.', false),
    GeneralQuestionClass(
        'Approximately one quarter of human bones are in the feet.', true),
    GeneralQuestionClass('A slug\'s blood is green.', true),
    GeneralQuestionClass(
        'Buzz Aldrin\'s mother\'s maiden name was "Moon".', true),
    GeneralQuestionClass(
        'It is illegal to pee in the Ocean in Portugal.', true),
    GeneralQuestionClass(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    GeneralQuestionClass(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    GeneralQuestionClass(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    GeneralQuestionClass(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    GeneralQuestionClass('Google was originally called "Backrub".', true),
    GeneralQuestionClass(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    GeneralQuestionClass(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];
  void nextQuestion() {
    if (_questionNumber < _generalQuestionbank.length - 1) {
      _questionNumber++;
    } else {
      print("question over");
    }
  }

  String getQuestion() {
    return _generalQuestionbank[_questionNumber].question;
  }

  bool getAnswer() {
    return _generalQuestionbank[_questionNumber].answer;
  }

  bool isQuestionOver() {
    if (_questionNumber < _generalQuestionbank.length - 1) {
      return true;
    }
    return false;
  }
}
