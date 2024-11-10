import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz/screens/home.dart';
import 'package:quiz/models/category.dart';
import 'package:quiz/models/quiz.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:quiz/data/dummy_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyQuiz extends StatefulWidget {
  final Category category;
  const MyQuiz({
    super.key,
    required this.category,
  });

  @override
  State<MyQuiz> createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> {
  // Quiz variables
  Quiz quiz = Quiz();
  int? selectedAnswer;
  bool hasAnswered = false;
  int score = 0;
  // Timer variables
  int initTime = 15;
  Timer? timer;
  bool isTimeUp = false;
  bool isQuizStarted = false;

  @override
  void initState() {
    super.initState();
    quiz.questionsList = DummyData.questions
        .where((question) => question.categoryId == widget.category.id)
        .toList();
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (initTime > 0) {
          initTime--;
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
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: AppColors.danger,
          ),
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: AppColors.lightGray,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    setState(() {
      if (!quiz.isFinished()) {
        selectedAnswer = null;
        hasAnswered = false;
        initTime = 15;
        isTimeUp = false;
        quiz.nextQuestion();
        startTimer();
      } else {
        timer?.cancel();
        isTimeUp = false;
        restartQuiz();
      }
    });
  }

  void restartQuiz() {
    var alertStyle = const AlertStyle(
      isCloseButton: false,
      isOverlayTapDismiss: false,
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24.0),
        ),
      ),
      overlayColor: Colors.black45,
    );
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.info,
      title: 'تم الانتهاء من الاختبار',
      desc: 'نتيجتك هي ${quiz.questionsList.length}/$score',
      buttons: [
        DialogButton(
          onPressed: () {
            setState(() {
              quiz.reset();
              isQuizStarted = false;
              selectedAnswer = null;
              hasAnswered = false;
              score = 0;
              timer?.cancel();
              initTime = 15;
              isTimeUp = false;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
          },
          color: AppColors.primary,
          radius: const BorderRadius.all(Radius.circular(16.0)),
          child: const Text(
            "حسنًا",
            style: TextStyle(
              color: AppColors.white,
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
      appBar: AppBar(
        leading: IconButton(
          style: const ButtonStyle(
            side: WidgetStatePropertyAll(
              BorderSide(
                color: AppColors.lightGray,
                width: 1.0,
              ),
            ),
          ),
          icon: const Icon(
            Icons.close,
            color: AppColors.charcoal,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
            border: Border.all(
              color: AppColors.lightGray,
              width: 1.0,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: (quiz.getQuestionNumber() + 1) /
                      quiz.questionsList.length,
                  minHeight: 10.0,
                  color: AppColors.secondary,
                  backgroundColor: AppColors.lightGray,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                '${quiz.getQuestionNumber() + 1}/${quiz.questionsList.length}',
                style: GoogleFonts.tajawal(
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 194.0,
                  padding: const EdgeInsets.all(16.0),
                  decoration: ShapeDecoration(
                    color: AppColors.background,
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 35.0,
                        cornerSmoothing: 1.0,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        quiz.getQuestionName(),
                        style: GoogleFonts.tajawal(
                          textStyle: const TextStyle(
                            fontSize: 20.0,
                            color: AppColors.charcoal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -20.0,
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundColor: AppColors.white,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 60.0,
                          height: 60.0,
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                            strokeWidth: 6.0,
                            strokeCap: StrokeCap.round,
                            value: initTime / 15,
                            backgroundColor: AppColors.lightGray,
                          ),
                        ),
                        Positioned(
                          top: 12.0,
                          child: Text(
                            '$initTime',
                            style: GoogleFonts.tajawal(
                              textStyle: const TextStyle(
                                fontSize: 30.0,
                                color: AppColors.gray,
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
            const SizedBox(height: 30.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: quiz.getOptions().length,
              itemExtent: 80.0,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                bool isSelected = index == selectedAnswer;
                bool isCorrect = index == quiz.getAnswer();
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: FilledButton(
                    onPressed: isQuizStarted
                        ? () {
                            checkAnswer(index);
                          }
                        : null,
                    style: ButtonStyle(
                      side: WidgetStatePropertyAll(
                        BorderSide(
                          color: isSelected
                              ? isCorrect
                                  ? AppColors.success
                                  : AppColors.danger
                              : AppColors.accent,
                          width: isSelected ? 3.0 : 2.0,
                        ),
                      ),
                      shape: WidgetStatePropertyAll(
                        SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 25.0,
                            cornerSmoothing: 1.0,
                          ),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        isSelected
                            ? isCorrect
                                ? AppColors.success.withOpacity(0.2)
                                : AppColors.danger.withOpacity(0.2)
                            : Colors.transparent,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          isSelected
                              ? isCorrect
                                  ? IconsaxPlusBold.tick_circle
                                  : IconsaxPlusBold.close_circle
                              : Icons.circle_outlined,
                          color: isSelected
                              ? isCorrect
                                  ? AppColors.success
                                  : AppColors.danger
                              : AppColors.accent,
                          size: 30.0,
                        ),
                        Text(
                          quiz.getOptions()[index],
                          style: GoogleFonts.tajawal(
                            textStyle: TextStyle(
                              fontSize: 20.0,
                              color: isSelected
                                  ? isCorrect
                                      ? Colors.green
                                      : AppColors.danger
                                  : AppColors.gray,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FilledButton(
          onPressed: () {
            setState(() {
              if (!isQuizStarted) {
                isQuizStarted = true;
                startTimer();
              } else {
                nextQuestion();
              }
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 25.0,
                cornerSmoothing: 1.0,
              ),
            ),
          ),
          child: Text(
            !isQuizStarted
                ? 'ابدأ'
                : quiz.isFinished()
                    ? 'إنهاء'
                    : 'التالي',
            style: GoogleFonts.tajawal(
              textStyle: const TextStyle(
                color: AppColors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }
}
