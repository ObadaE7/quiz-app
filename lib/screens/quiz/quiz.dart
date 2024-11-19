import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz/screens/main/tabs.dart';
import 'package:quiz/screens/quiz/finish_quiz.dart';
import 'package:quiz/models/quiz.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:quiz/data/dummy_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyQuiz extends StatefulWidget {
  final int categoryId;
  const MyQuiz({super.key, required this.categoryId});

  @override
  State<MyQuiz> createState() => _MyQuizState();
}

class _MyQuizState extends State<MyQuiz> with TickerProviderStateMixin {
  // Circular indicator
  late AnimationController circularIndicatorController;
  late Animation<double> circularIndicatorAnimation;
  late Animation circularIndicatorColorAnimation;
  // Linear indicator
  late AnimationController linearIndicatorController;
  late Animation<double> linearIndicatorAnimation;

  Quiz quiz = Quiz();
  int score = 0;
  int? selectedAnswer;
  bool hasAnswered = false;

  Timer? timer;
  int initTime = 15;
  bool isTimeUp = false; // Flag to check if the time is up
  bool isTimePaused = false; // Flag to check if the time is paused
  // To store the progress position of a paused animation.
  double pausedAnimationProgress = 0.0;

  @override
  void initState() {
    super.initState();
    // Filter questions
    quiz.questionsList = DummyData.questions
        .where((question) => question.categoryId == widget.categoryId)
        .toList();
    // Shuffle questions
    quiz.shuffleQuestions();

    // Initialize circular indicator
    circularIndicatorController = AnimationController(
      vsync: this,
      duration: Duration(seconds: initTime),
    );
    circularIndicatorAnimation =
        Tween<double>(begin: 1, end: 0).animate(circularIndicatorController);
    circularIndicatorColorAnimation = ColorTween(
      begin: AppColors.cyan,
      end: AppColors.red,
    ).animate(circularIndicatorController);

    // Initialize linear indicator
    linearIndicatorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    linearIndicatorAnimation = Tween<double>(
      begin: 0,
      end: 1 / quiz.questionsList.length,
    ).animate(linearIndicatorController);

    linearIndicatorController.forward();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    circularIndicatorController.dispose();
    linearIndicatorController.dispose();
  }

  void startTimer() {
    timer?.cancel();
    if (isTimePaused) {
      isTimePaused = false;
      circularIndicatorController.forward(from: pausedAnimationProgress);
    } else {
      circularIndicatorController.reset();
      circularIndicatorController.forward();
    }

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (initTime > 0) {
          initTime--;
        } else {
          timer.cancel();
          isTimeUp = true;
          playSound('sounds/wrong.aac');
          nextQuestion();
        }
      });
    });
  }

  void pauseTimer() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      isTimePaused = true;
      // Get the current progress of the animation
      pausedAnimationProgress = circularIndicatorController.value;
      circularIndicatorController.stop();
    }
  }

  void checkAnswer(int userPickedAnswer) {
    if (hasAnswered) return;
    setState(() {
      selectedAnswer = userPickedAnswer;
      hasAnswered = true;
      isTimeUp = false;
      timer?.cancel();
      circularIndicatorController.stop();
      if (userPickedAnswer == quiz.getAnswer()) {
        score++;
        playSound('sounds/correct.aac');
      } else {
        playSound('sounds/wrong.aac');
      }
    });
  }

  void nextQuestion() {
    // Clear the snack bar if the user does not select an answer
    // and clicks the next button multiple times and then answers the question,
    // to prevent the snack bar from continuing to display
    ScaffoldMessenger.of(context).clearSnackBars();

    if (!hasAnswered && !isTimeUp) {
      const snackBar = SnackBar(
        content: Text(
          'الرجاء اختيار الإجابة قبل المتابعة',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: AppColors.red,
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
        linearIndicatorController.reset();

        linearIndicatorAnimation = Tween<double>(
          begin: (quiz.getQuestionNumber() + 1) / quiz.questionsList.length,
          end: (quiz.getQuestionNumber() + 2) / quiz.questionsList.length,
        ).animate(linearIndicatorController);

        linearIndicatorController.forward();
        quiz.nextQuestion();
        startTimer();
      } else {
        timer?.cancel();
        isTimeUp = false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FinishQuiz(
              questionCount: quiz.questionsList.length,
              score: score,
            ),
          ),
        );
      }
    });
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
            pauseTimer();

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
              image: const Image(
                image: AssetImage('assets/animations/warning.png'),
                width: 90.0,
                height: 90.0,
              ),
              title: 'إنهاء الاختبار',
              content: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'هل ترغب في إنهاء الاختبار الآن؟ سيتم فقدان جميع الإجابات غير المحفوظة.',
                  style: GoogleFonts.tajawal(
                    color: AppColors.mediumGray,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                ),
              ),
              buttons: [
                DialogButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Tabs(),
                      ),
                    );
                  },
                  color: AppColors.red,
                  radius: const BorderRadius.all(Radius.circular(16.0)),
                  child: const Text(
                    "الإنهاء",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                DialogButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (!hasAnswered && !isTimeUp) {
                      startTimer();
                      circularIndicatorController.forward();
                    }
                  },
                  color: AppColors.cyan,
                  radius: const BorderRadius.all(Radius.circular(16.0)),
                  child: const Text(
                    "المتابعة",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ).show();
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
                child: AnimatedBuilder(
                  animation: linearIndicatorController,
                  builder: (context, child) => LinearProgressIndicator(
                    value: linearIndicatorAnimation.value,
                    minHeight: 10.0,
                    color: AppColors.orange,
                    backgroundColor: AppColors.lightGray,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                '${quiz.getQuestionNumber() + 1}/${quiz.questionsList.length}',
                style: GoogleFonts.tajawal(
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    color: AppColors.cyan,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.offWhite,
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
                    color: AppColors.lightBlue,
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
                        textDirection: TextDirection.rtl,
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
                        AnimatedBuilder(
                          animation: circularIndicatorController,
                          builder: (context, child) {
                            return SizedBox(
                              width: 60.0,
                              height: 60.0,
                              child: CircularProgressIndicator(
                                value: circularIndicatorAnimation.value,
                                color: circularIndicatorColorAnimation.value,
                                strokeWidth: 6.0,
                                strokeCap: StrokeCap.round,
                                backgroundColor: AppColors.lightGray,
                              ),
                            );
                          },
                        ),
                        Positioned(
                          top: 12.0,
                          child: Text(
                            '$initTime',
                            style: GoogleFonts.tajawal(
                              textStyle: const TextStyle(
                                fontSize: 30.0,
                                color: AppColors.mediumGray,
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
                    onPressed: () {
                      checkAnswer(index);
                    },
                    style: ButtonStyle(
                      side: WidgetStatePropertyAll(
                        BorderSide(
                          color: isSelected
                              ? isCorrect
                                  ? AppColors.green
                                  : AppColors.red
                              : AppColors.lightAccent,
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
                                ? AppColors.green.withOpacity(0.2)
                                : AppColors.red.withOpacity(0.2)
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
                                  ? AppColors.green
                                  : AppColors.red
                              : AppColors.lightAccent,
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
                                      : AppColors.red
                                  : AppColors.mediumGray,
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
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
        child: FilledButton(
          onPressed: () {
            nextQuestion();
          },
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(AppColors.cyan),
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 16.0)),
            shape: WidgetStatePropertyAll(
              SmoothRectangleBorder(
                borderRadius: SmoothBorderRadius(
                  cornerRadius: 25.0,
                  cornerSmoothing: 1.0,
                ),
              ),
            ),
          ),
          child: Text(
            quiz.isFinished() ? 'إنهاء' : 'التالي',
            style: GoogleFonts.tajawal(
              textStyle: const TextStyle(
                color: AppColors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.offWhite,
    );
  }
}
