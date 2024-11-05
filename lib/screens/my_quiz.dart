import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz/models/quiz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyQuiz extends StatefulWidget {
  const MyQuiz({super.key});

  @override
  State<MyQuiz> createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  Quiz quiz = Quiz();
  int? selectedAnswer;
  bool hasAnswered = false;
  int score = 0;
  int time = 15;
  Timer? timer;
  bool isTimeUp = false;
  bool isQuizStarted = false;

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (time > 0) {
          time--;
        } else {
          timer.cancel();
          isTimeUp = true;
          playSound('wrong.aac');
          nextQuestion();
        }
      });
    });
  }

  void checkAnswer(int userPickedAnswer) {
    if (hasAnswered) return;
    setState(() {
      selectedAnswer = userPickedAnswer;
      hasAnswered = true;
      isTimeUp = false;
      timer?.cancel();
      if (userPickedAnswer == quiz.getAnswer()) {
        score++;
        playSound('correct.aac');
      } else {
        playSound('wrong.aac');
      }
    });
  }

  void nextQuestion() {
    if (!hasAnswered && !isTimeUp) {
      const snackBar = SnackBar(
        content: Text(
          'الرجاء اختيار الإجابة قبل المتابعة',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    setState(() {
      if (!quiz.isFinished()) {
        selectedAnswer = null;
        hasAnswered = false;
        time = 15;
        isTimeUp = false;
        quiz.nextQuestion();
        startTimer();
      }
    });
  }

  void restartQuiz() {
    var alertStyle = const AlertStyle(
      isCloseButton: false,
      isOverlayTapDismiss: false,
    );
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.info,
      title: 'تم الانتهاء من الاختبار',
      desc: 'نتيجتك هي $score/${quiz.questions.length} ',
      buttons: [
        DialogButton(
          onPressed: () {
            setState(() {
              quiz.reset();
              selectedAnswer = null;
              hasAnswered = false;
              score = 0;
              timer?.cancel();
              time = 15;
              isTimeUp = false;
            });
            Navigator.pop(context);
          },
          color: Colors.indigo,
          child: const Text(
            "حسنًا",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    ).show();
  }

  Future<void> playSound(String soundPath) async {
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play(AssetSource(soundPath));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.pink],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35.0),
                      bottomRight: Radius.circular(35.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'السؤال ${quiz.questions.length}/${quiz.getQuestionNumber() + 1}',
                        style: GoogleFonts.tajawal(
                          textStyle: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        quiz.getQuestionName(),
                        style: GoogleFonts.tajawal(
                          textStyle: const TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -140,
                  left: -180,
                  child: CircleAvatar(
                    radius: 200.0,
                    backgroundColor: Colors.white.withOpacity(.1),
                  ),
                ),
                Positioned(
                  bottom: -50.0,
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.white,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 60.0,
                          height: 60.0,
                          child: CircularProgressIndicator(
                            color: Colors.purple,
                            strokeWidth: 6.0,
                            strokeCap: StrokeCap.round,
                            value: time / 15,
                            backgroundColor: Colors.purple.withOpacity(.1),
                          ),
                        ),
                        Positioned(
                          top: 12.0,
                          child: Text(
                            '$time',
                            style: GoogleFonts.tajawal(
                              textStyle: const TextStyle(
                                fontSize: 30.0,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: quiz.getOptions().length,
                    itemExtent: 100.0,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      bool isSelected = index == selectedAnswer;
                      bool isCorrect = index == quiz.getAnswer();
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ElevatedButton(
                          onPressed: isQuizStarted
                              ? () {
                                  checkAnswer(index);
                                }
                              : null,
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              isSelected
                                  ? isCorrect
                                      ? Colors.green[100]
                                      : Colors.red[100]
                                  : Colors.purple[50],
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                            elevation: const WidgetStatePropertyAll(0.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                isSelected
                                    ? isCorrect
                                        ? Icons.check_circle_outlined
                                        : Icons.cancel_outlined
                                    : Icons.circle_outlined,
                                color: isSelected
                                    ? isCorrect
                                        ? Colors.green
                                        : Colors.red
                                    : Colors.purple,
                              ),
                              Text(
                                quiz.getOptions()[index],
                                style: GoogleFonts.tajawal(
                                  textStyle: TextStyle(
                                    fontSize: 20.0,
                                    color: isSelected
                                        ? isCorrect
                                            ? Colors.green
                                            : Colors.red
                                        : Colors.purple,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Colors.purple,
                          Colors.pink,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (!isQuizStarted) {
                            isQuizStarted = true;
                            startTimer();
                          } else {
                            !quiz.isFinished() ? nextQuestion() : restartQuiz();
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Text(
                        !isQuizStarted
                            ? 'ابدء'
                            : quiz.isFinished()
                                ? 'إنهاء'
                                : 'التالي',
                        style: GoogleFonts.tajawal(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
