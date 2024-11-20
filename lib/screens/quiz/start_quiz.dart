import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz/quiz.dart';
import 'package:quiz/widgets/action_button.dart';
import 'package:quiz/widgets/circle_placeholder.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:quiz/models/category.dart';
import 'package:quiz/data/dummy_data.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:figma_squircle/figma_squircle.dart';

class StartQuiz extends StatefulWidget {
  final Category category;
  const StartQuiz({super.key, required this.category});

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  bool _isAnimatedContainerExpanded = false;
  late int _questionsCount;
  late double _estimatedTime;

  @override
  void initState() {
    super.initState();

    _animateContainer();
    _initializeQuestionData();
  }

  void _initializeQuestionData() {
    _questionsCount = DummyData.questions
        .where((question) => question.categoryId == widget.category.id)
        .length;

    _estimatedTime = _questionsCount * 15 / 60;
  }

  void _animateContainer() {
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() => _isAnimatedContainerExpanded = true);
    });
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
              const Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: 0.3,
                    backgroundColor: AppColors.lightGray,
                    color: AppColors.cyan,
                    strokeWidth: 15.0,
                    strokeAlign: 4.0,
                    strokeCap: StrokeCap.round,
                  ),
                  Text(
                    '30%',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.cyan,
                    ),
                  ),
                ],
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyQuiz(
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
