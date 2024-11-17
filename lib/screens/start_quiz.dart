import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz.dart';
import 'package:quiz/models/category.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:quiz/data/dummy_data.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:figma_squircle/figma_squircle.dart';

class StartQuiz extends StatelessWidget {
  final Category category;
  const StartQuiz({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  width: MediaQuery.of(context).size.width,
                  height: 400.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF3EB8D4),
                        Color(0xFF1F8DA6),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: category.title,
                        child: Image(
                          image: AssetImage(
                            category.imagePath,
                          ),
                          width: 120.0,
                          height: 120.0,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        category.title,
                        style: GoogleFonts.tajawal(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                //  Bottom rounded shape
                const Positioned(
                  bottom: -950.0,
                  child: CircleAvatar(
                    radius: 500,
                    backgroundColor: Color(0xFFfafafa),
                  ),
                ),
                // Circles
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
                  bottom: 170.0,
                  left: 10.0,
                  child: CirclePlaceholder(radius: 20.0),
                ),
                const Positioned(
                  bottom: 210.0,
                  left: 70.0,
                  child: CirclePlaceholder(radius: 10.0),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
              child: Column(
                children: [
                  Text(
                    category.description,
                    style: GoogleFonts.tajawal(
                      fontSize: 20,
                      color: AppColors.gray,
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: Text(
                      "${DummyData.questions.where((question) => question.categoryId == category.id).length} سؤال",
                      style: GoogleFonts.tajawal(
                        fontSize: 20,
                        color: AppColors.gray,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    title: Text(
                      "عدد الاسئلة",
                      style: GoogleFonts.tajawal(
                        fontSize: 20,
                        color: AppColors.gray,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    trailing: const Icon(
                      HugeIcons.strokeRoundedQuiz05,
                      color: AppColors.secondary,
                      size: 35,
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      "${(DummyData.questions.where((question) => question.categoryId == category.id).length * 15 / 60).toStringAsFixed(1)} دقائق",
                      style: GoogleFonts.tajawal(
                        fontSize: 20,
                        color: AppColors.gray,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    title: Text(
                      "الوقت التقريبي",
                      style: GoogleFonts.tajawal(
                        fontSize: 20,
                        color: AppColors.gray,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    trailing: const Icon(
                      HugeIcons.strokeRoundedTimer02,
                      color: AppColors.primary,
                      size: 35,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.43,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  side: const WidgetStatePropertyAll(
                    BorderSide(color: AppColors.primary),
                  ),
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
                  'لاحقاً',
                  style: GoogleFonts.tajawal(
                    textStyle: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.43,
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyQuiz(
                        categoryId: category.id,
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      const WidgetStatePropertyAll(AppColors.primary),
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
                  'ابدأ الآن',
                  style: GoogleFonts.tajawal(
                    textStyle: const TextStyle(
                      color: AppColors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CirclePlaceholder extends StatelessWidget {
  final double radius;
  final double? opacity;

  const CirclePlaceholder({
    super.key,
    required this.radius,
    this.opacity = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white.withOpacity(opacity!),
    );
  }
}
