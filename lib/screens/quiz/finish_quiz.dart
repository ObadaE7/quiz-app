import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz/data/dummy_data.dart';
import 'package:quiz/models/category.dart';
import 'package:quiz/screens/main/tabs.dart';
import 'package:quiz/screens/quiz/start_quiz.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:quiz/widgets/action_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FinishQuiz extends StatefulWidget {
  final int categoryId;
  final int questionsCount;
  final int score;
  const FinishQuiz({
    super.key,
    required this.categoryId,
    required this.questionsCount,
    required this.score,
  });

  @override
  State<FinishQuiz> createState() => _FinishQuizState();
}

class _FinishQuizState extends State<FinishQuiz> {
  late bool isPassed;
  late Category category;
  @override
  void initState() {
    super.initState();
    category =
        DummyData.categories.firstWhere((cat) => cat.id == widget.categoryId);
    isPassed = widget.score >= (widget.questionsCount / 2) ? true : false;
  }

  Future<void> _restartQuiz() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loggedInEmail = prefs.getString('loggedInEmail');
    String? usersPrefsData = prefs.getString('users');
    Map<String, List<dynamic>> usersMapData = {};
    if (usersPrefsData == null || loggedInEmail == null) return;

    usersMapData = Map<String, List<dynamic>>.from(json.decode(usersPrefsData));
    List<dynamic> userData = usersMapData[loggedInEmail]!;

    if (usersMapData.containsKey(loggedInEmail)) {
      for (var data in userData) {
        if (data is Map<String, dynamic> &&
            data['categoryId'] == widget.categoryId) {
          data['score'] = 0;
          data['answeredQuestionsIds'] = [];
          await prefs.setString('users', json.encode(usersMapData));
        }
      }
    }
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
                    _restartQuiz();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartQuiz(
                          category: category,
                        ),
                      ),
                    );
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
