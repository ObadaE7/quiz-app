import 'package:quiz/data/dummy_data.dart';

class Quiz {
  int _questionNumber = 0;
  List questionsList = DummyData.questions;

  String getQuestionName() {
    return questionsList[_questionNumber].text;
  }

  List<String> getOptions() {
    return questionsList[_questionNumber].options;
  }

  int getAnswer() {
    return questionsList[_questionNumber].answer;
  }

  int getQuestionNumber() {
    return _questionNumber;
  }

  void nextQuestion() {
    if (_questionNumber < questionsList.length - 1) {
      _questionNumber++;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  bool isFinished() {
    return _questionNumber == questionsList.length - 1;
  }
}
