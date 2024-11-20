import 'package:flutter/material.dart';
import 'package:quiz/screens/main/tabs.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/widgets/action_button.dart';

class FinishQuiz extends StatefulWidget {
  final int questionsCount;
  final int score;
  const FinishQuiz({
    super.key,
    required this.questionsCount,
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
    isPassed = widget.score >= (widget.questionsCount / 2) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  isPassed
                      ? "assets/animations/party.png"
                      : "assets/animations/peeking.png",
                ),
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 40),
              Text(
                "نتيجتك هي",
                style: GoogleFonts.tajawal(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.charcoal,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${widget.questionsCount} / ",
                    style: GoogleFonts.tajawal(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.charcoal,
                    ),
                  ),
                  Text(
                    "${widget.score}",
                    style: GoogleFonts.tajawal(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: AppColors.cyan,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                isPassed
                    ? "أنت بطل! لقد هزمت الأسئلة! 🎉"
                    : "أنت قريب جدًا! هيا بنا نعيد المحاولة! 💪",
                style: GoogleFonts.tajawal(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mediumGray,
                ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ActionButton(
                  isFilled: false,
                  label: 'إعادة من جديد',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ActionButton(
                  isHasIcon: false,
                  label: 'الرئيسية',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Tabs(),
                      ),
                    );
                  },
                  isFilled: true,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.offWhite,
    );
  }
}
