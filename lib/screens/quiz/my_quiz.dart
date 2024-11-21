import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
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
  late AnimationController _circularIndicatorController;
  late Animation<double> _circularIndicatorAnimation;
  late Animation _circularIndicatorColorAnimation;

  late AnimationController _linearIndicatorController;
  late Animation<double> _linearIndicatorAnimation;

  late AnimationController _slideTransitionController;
  late Animation<Offset> _slideAnimation;

  Quiz quiz = Quiz();
  int score = 0;
  int? selectedAnswer;
  bool hasAnswered = false;

  Timer? timer;
  int initTime = 15;
  bool isTimeUp = false;
  bool isTimePaused = false;
  // To store the progress position of a paused animation.
  double pausedAnimationProgress = 0.0;

  @override
  void initState() {
    super.initState();

    _initQuestionsData();
    _initCircularController();
    _initLinearController();
    _initSlideController();
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    _circularIndicatorController.dispose();
    _linearIndicatorController.dispose();
    _slideTransitionController.dispose();
  }

  void _initQuestionsData() {
    // Filter questions by category
    quiz.questionsList = DummyData.questions
        .where((question) => question.categoryId == widget.categoryId)
        .toList();
    // Shuffle questions
    quiz.shuffleQuestions();
  }

  void _initCircularController() {
    _circularIndicatorController = AnimationController(
      vsync: this,
      duration: Duration(seconds: initTime),
    );

    _circularIndicatorAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(_circularIndicatorController);

    _circularIndicatorColorAnimation = ColorTween(
      begin: AppColors.cyan,
      end: AppColors.red,
    ).animate(_circularIndicatorController);
  }

  void _initLinearController() {
    _linearIndicatorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _linearIndicatorAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0 / quiz.questionsList.length,
    ).animate(_linearIndicatorController);

    _linearIndicatorController.forward();
  }

  void _initSlideController() {
    _slideTransitionController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _slideTransitionController,
        curve: Curves.easeInOutBack,
      ),
    );

    _slideTransitionController.forward();
  }

  void _startTimer() {
    timer?.cancel();
    if (isTimePaused) {
      isTimePaused = false;
      _circularIndicatorController.forward(from: pausedAnimationProgress);
    } else {
      _circularIndicatorController.reset();
      _circularIndicatorController.forward();
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

  void _pauseQuiz() {
    if (timer != null && timer!.isActive) {
      timer!.cancel();
      isTimePaused = true;
      // Get the current progress of the animation
      pausedAnimationProgress = _circularIndicatorController.value;
      _circularIndicatorController.stop();
      // Show the alert
      _alertDialog();
    }
  }

  void _alertDialog() {
    Alert(
      context: context,
      style: const AlertStyle(
        isCloseButton: false,
        isOverlayTapDismiss: false,
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
        ),
        overlayColor: Colors.black45,
      ),
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
              MaterialPageRoute(builder: (context) => const Tabs()),
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
              _startTimer();
              _circularIndicatorController.forward();
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
  }

  void checkAnswer(int userPickedAnswer) {
    if (hasAnswered) return;
    setState(() {
      selectedAnswer = userPickedAnswer;
      hasAnswered = true;
      isTimeUp = false;
      timer?.cancel();
      _circularIndicatorController.stop();
      if (userPickedAnswer == quiz.getAnswer()) {
        score++;
        playSound('sounds/correct.aac');
      } else {
        playSound('sounds/wrong.aac');
      }
    });
  }

  void nextQuestion() {
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
        // Reset the values
        selectedAnswer = null;
        hasAnswered = false;
        initTime = 15;
        isTimeUp = false;
        _linearIndicatorController.reset();
        _slideTransitionController.reset();

        // Reinitialize for the next question
        _linearIndicatorAnimation = Tween<double>(
          begin: (quiz.getQuestionNumber() + 1) / quiz.questionsList.length,
          end: (quiz.getQuestionNumber() + 2) / quiz.questionsList.length,
        ).animate(
          CurvedAnimation(
            parent: _linearIndicatorController,
            curve: Curves.easeOutBack,
          ),
        );

        _linearIndicatorController.forward();
        _slideTransitionController.forward();

        quiz.nextQuestion();
        _startTimer();
      } else {
        // Quiz is finished
        timer?.cancel();
        isTimeUp = false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FinishQuiz(
              questionsCount: quiz.questionsList.length,
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
            HugeIcons.strokeRoundedPause,
            color: AppColors.charcoal,
            size: 20.0,
          ),
          onPressed: () => _pauseQuiz(),
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
                  animation: _linearIndicatorController,
                  builder: (context, child) => LinearProgressIndicator(
                    value: _linearIndicatorAnimation.value,
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SlideTransition(
              position: _slideAnimation,
              child: Stack(
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
                      backgroundColor: AppColors.offWhite,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedBuilder(
                            animation: _circularIndicatorController,
                            builder: (context, child) => SizedBox(
                              width: 60.0,
                              height: 60.0,
                              child: CircularProgressIndicator(
                                value: _circularIndicatorAnimation.value,
                                color: _circularIndicatorColorAnimation.value,
                                strokeWidth: 6.0,
                                strokeCap: StrokeCap.round,
                                backgroundColor: AppColors.lightGray,
                              ),
                            ),
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
                return SlideTransition(
                  position: _slideAnimation,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: FilledButton(
                      onPressed: () => checkAnswer(index),
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
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
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
          onPressed: () => nextQuestion(),
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(AppColors.cyan),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(vertical: 16.0),
            ),
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
