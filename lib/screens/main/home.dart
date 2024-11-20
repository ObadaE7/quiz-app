import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz/start_quiz.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:quiz/widgets/category.dart';
import 'package:quiz/data/dummy_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 24.0,
                    backgroundImage: AssetImage('assets/avatars/avatar-1.png'),
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
                          color: AppColors.mediumGray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Container(
                height: 100.0,
                width: MediaQuery.of(context).size.width,
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
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      offset: const Offset(1, 1),
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
                                color: AppColors.cyan,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20.0),
                        const Image(
                          image: AssetImage('assets/animations/coin.png'),
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
                                color: AppColors.cyan,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20.0),
                        const Image(
                          image: AssetImage('assets/animations/trophy.png'),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'عرض الكل',
                          style: GoogleFonts.tajawal(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: AppColors.cyan,
                          ),
                        ),
                      ),
                      Text(
                        'جاهز للتحدي؟',
                        style: GoogleFonts.tajawal(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.charcoal,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'قم باختيار التصنيف المناسب لك وابدأ الاختبار',
                    style: GoogleFonts.tajawal(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mediumGray,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              MasonryGridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 40,
                crossAxisSpacing: 20,
                itemCount: DummyData.categories.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartQuiz(
                          category: DummyData.categories[index],
                        ),
                      ),
                    );
                  },
                  child: Category(
                    height: index.isEven ? 180 : 200,
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
      backgroundColor: AppColors.offWhite,
    );
  }
}
