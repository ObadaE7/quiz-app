import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz/finish_quiz.dart';
import 'package:quiz/screens/quiz/my_quiz.dart';
import 'package:quiz/widgets/action_button.dart';
import 'package:quiz/widgets/circle_placeholder.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:quiz/models/category.dart';
import 'package:quiz/data/dummy_data.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartQuiz extends StatefulWidget {
  final Category category;
  const StartQuiz({super.key, required this.category});

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz>
    with SingleTickerProviderStateMixin {
  late AnimationController _circularIndicatorController;
  late Animation<double> _circularIndicatorAnimation;

  bool _isAnimatedContainerExpanded = false;
  int _progressRate = 0;
  late int _questionsCount;
  late double _estimatedTime;

  bool _isAllQuestionsAnswered = false;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _initAnimatedContainer();
    _initQuestionsData();
    _getProgressRate();
  }

  @override
  void dispose() {
    _circularIndicatorController.dispose();
    super.dispose();
  }

  void _initQuestionsData() {
    _questionsCount = DummyData.questions
        .where((question) => question.categoryId == widget.category.id)
        .length;

    _estimatedTime = _questionsCount * 15 / 60;
  }

  Future<void> _getProgressRate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loggedInEmail = prefs.getString('loggedInEmail');
    String? usersPrefsData = prefs.getString('users');
    Map<String, List<dynamic>> usersMapData = {};

    if (usersPrefsData == null || loggedInEmail == null) return;

    int answeredQuestionsCount = 0;
    usersMapData = Map<String, List<dynamic>>.from(json.decode(usersPrefsData));

    if (usersMapData.containsKey(loggedInEmail)) {
      List<dynamic> userData = usersMapData[loggedInEmail]!;
      for (var data in userData) {
        try {
          if (data['categoryId'] == widget.category.id) {
            List<dynamic> answeredQuestionsIds = data['answeredQuestionsIds'];
            answeredQuestionsCount += answeredQuestionsIds.length;
            _score = data['score'];
          }
        } catch (e) {
          // ignore: avoid_print
          print(e);
        }
      }
      _isAllQuestionsAnswered = answeredQuestionsCount == _questionsCount;
      setState(() {
        _progressRate =
            (answeredQuestionsCount / _questionsCount * 100).toInt();
      });
      _initCircularController();
    }
  }

  // void _initAnimatedContainer() {
  //   Future.delayed(const Duration(milliseconds: 400), () {
  //     setState(() => _isAnimatedContainerExpanded = true);
  //   });
  // }
  // You can replace the Future.delayed with a direct use of WidgetsBinding.instance.addPostFrameCallback
  // to trigger state changes after the first frame.
  // This is a more efficient and clearer way to handle delayed state changes.
  void _initAnimatedContainer() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() => _isAnimatedContainerExpanded = true);
    });
  }

  void _initCircularController() {
    _circularIndicatorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _circularIndicatorAnimation = Tween<double>(
      begin: 0.0,
      end: _progressRate / 100,
    ).animate(
      CurvedAnimation(
        parent: _circularIndicatorController,
        curve: Curves.easeOutBack,
      ),
    );

    _circularIndicatorController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  AnimatedContainer(
                    width: _isAnimatedContainerExpanded
                        ? MediaQuery.of(context).size.width
                        : 150.0,
                    height: _isAnimatedContainerExpanded ? 194.0 : 150.0,
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 500),
                    padding: const EdgeInsets.all(16.0),
                    decoration: ShapeDecoration(
                      shape: SmoothRectangleBorder(
                        borderRadius: SmoothBorderRadius(
                          cornerRadius: 35.0,
                          cornerSmoothing: 1.0,
                        ),
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.cyan,
                          AppColors.darkCyan,
                        ],
                      ),
                    ),
                  ),
                  Hero(
                    tag: widget.category.title,
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white38,
                            blurRadius: 40,
                            offset: Offset(0, 30),
                            spreadRadius: -10,
                          ),
                        ],
                      ),
                      child: Image(
                        image: AssetImage(widget.category.imagePath),
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: -50.0,
                    right: -100.0,
                    child: CirclePlaceholder(radius: 100.0),
                  ),
                  const Positioned(
                    top: -50.0,
                    left: 20.0,
                    child: CirclePlaceholder(radius: 50.0),
                  ),
                  const Positioned(
                    bottom: 70.0,
                    left: 10.0,
                    child: CirclePlaceholder(radius: 20.0),
                  ),
                  const Positioned(
                    bottom: 10.0,
                    left: 70.0,
                    child: CirclePlaceholder(radius: 10.0),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.category.title,
                style: GoogleFonts.tajawal(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.charcoal,
                ),
              ),
              Text(
                widget.category.description,
                style: GoogleFonts.tajawal(
                  fontSize: 18,
                  color: AppColors.mediumGray,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 46.0),
              AnimatedBuilder(
                animation: _circularIndicatorAnimation,
                builder: (context, child) {
                  int progressValue =
                      (_circularIndicatorAnimation.value * 100.0).toInt();
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: _circularIndicatorAnimation.value,
                        backgroundColor: AppColors.lightGray,
                        color: AppColors.cyan,
                        strokeWidth: 15.0,
                        strokeAlign: 4.0,
                        strokeCap: StrokeCap.round,
                      ),
                      Text(
                        '$progressValue%',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.cyan,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 46.0),
              Text(
                'التقدم في التحدي',
                style: GoogleFonts.tajawal(
                  fontSize: 16,
                  color: AppColors.charcoal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                textDirection: TextDirection.rtl,
                children: [
                  Column(
                    children: [
                      const Icon(
                        HugeIcons.strokeRoundedQuiz04,
                        color: Colors.teal,
                        size: 28.0,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '$_questionsCount',
                        style: GoogleFonts.tajawal(
                          fontSize: 20,
                          color: AppColors.charcoal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(
                        HugeIcons.strokeRoundedTimer02,
                        color: Colors.teal,
                        size: 28.0,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '$_estimatedTime',
                        style: GoogleFonts.tajawal(
                          fontSize: 20,
                          color: AppColors.charcoal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(
                        HugeIcons.strokeRoundedAiBrain01,
                        color: Colors.teal,
                        size: 28.0,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'متوسط',
                        style: GoogleFonts.tajawal(
                          fontSize: 20,
                          color: AppColors.charcoal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.43,
              child: ActionButton(
                isFilled: false,
                label: 'لاحقاً',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.43,
              child: ActionButton(
                isFilled: true,
                isHasIcon: true,
                icon: HugeIcons.strokeRoundedBackward01,
                label: 'ابدأ الآن',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _isAllQuestionsAnswered
                          ? FinishQuiz(
                              categoryId: widget.category.id,
                              questionsCount: _questionsCount,
                              score: _score,
                            )
                          : MyQuiz(
                              categoryId: widget.category.id,
                            ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.offWhite,
    );
  }
}
