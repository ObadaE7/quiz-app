import 'package:flutter/material.dart';
import 'package:quiz/screens/tabs.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:figma_squircle/figma_squircle.dart';

class FinishQuiz extends StatefulWidget {
  final int questionCount;
  final int score;
  const FinishQuiz({
    super.key,
    required this.questionCount,
    required this.score,
  });

  @override
  State<FinishQuiz> createState() => _FinishQuizState();
}

class _FinishQuizState extends State<FinishQuiz> {
  late bool isPassed;

  @override
  void initState() {
    super.initState();
    isPassed = widget.score >= (widget.questionCount / 2) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
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
            Image(
              image: AssetImage(
                isPassed
                    ? "assets/animations/party.png"
                    : "assets/animations/peeking.png",
              ),
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 40),
            Text(
              "النتيجة النهائية",
              style: GoogleFonts.tajawal(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${widget.questionCount}",
                  style: GoogleFonts.tajawal(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "/",
                  style: GoogleFonts.tajawal(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "${widget.score}",
                  style: GoogleFonts.tajawal(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                isPassed
                    ? "أنت بطل! لقد هزمت الأسئلة! 🎉"
                    : "أنت قريب جدًا! هيا بنا نعيد المحاولة! 💪",
                style: GoogleFonts.tajawal(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 300.0,
              child: FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(
                    Colors.white,
                  ),
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                  "إعادة المحاولة",
                  style: GoogleFonts.tajawal(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.charcoal,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300.0,
              child: FilledButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Tabs(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(
                    Colors.white,
                  ),
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                  "الرئيسية",
                  style: GoogleFonts.tajawal(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.charcoal,
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
