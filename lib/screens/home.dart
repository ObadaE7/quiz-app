import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:quiz/widgets/category.dart';
import 'package:quiz/data/dummy_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:figma_squircle/figma_squircle.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('images/avatar.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'مرحبا، عبادة',
                        style: GoogleFonts.tajawal(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.charcoal,
                        ),
                      ),
                      Text(
                        'أطلق العنان لعقلك واختبر معلوماتك',
                        style: GoogleFonts.tajawal(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Container(
                height: 90.0,
                width: double.infinity,
                decoration: ShapeDecoration(
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 25.0,
                      cornerSmoothing: 1,
                    ),
                  ),
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'النقاط',
                              style: GoogleFonts.tajawal(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.charcoal,
                              ),
                            ),
                            Text(
                              '1209',
                              style: GoogleFonts.tajawal(
                                fontSize: 20.0,
                                color: AppColors.darkBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20.0),
                        const Image(
                          image: AssetImage('images/coin.png'),
                          height: 40.0,
                          width: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'التصنيف',
                              style: GoogleFonts.tajawal(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: AppColors.charcoal,
                              ),
                            ),
                            Text(
                              '348',
                              style: GoogleFonts.tajawal(
                                fontSize: 20.0,
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20.0),
                        const Image(
                          image: AssetImage('images/trophy.png'),
                          height: 40.0,
                          width: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                '!جاهز للتحدي؟ اضغط وابدأ',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.charcoal,
                ),
              ),
              const SizedBox(height: 40.0),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 40,
                  mainAxisExtent: 200.0,
                ),
                itemCount: DummyData.categories.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyQuiz(
                          category: DummyData.categories[index],
                        ),
                      ),
                    );
                  },
                  child: Category(
                    imagePath: DummyData.categories[index].imagePath,
                    title: DummyData.categories[index].title,
                    questionCount: DummyData.questions
                        .where((question) =>
                            question.categoryId ==
                            DummyData.categories[index].id)
                        .length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }
}
