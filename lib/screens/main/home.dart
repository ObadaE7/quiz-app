import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz/start_quiz.dart';
import 'package:quiz/widgets/category_card.dart';
import 'package:quiz/utils/app_colors.dart';
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
                height: 120.0,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                decoration: ShapeDecoration(
                  color: AppColors.white,
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 35.0,
                      cornerSmoothing: 1.0,
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoItem(
                      title: 'النقاط',
                      value: '1209',
                      imagePath: 'assets/animations/coin.png',
                    ),
                    Container(
                      width: 1.0,
                      height: 70.0,
                      color: Colors.grey.shade300,
                    ),
                    _buildInfoItem(
                      title: 'التصنيف',
                      value: '348',
                      imagePath: 'assets/animations/trophy.png',
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
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StartQuiz(
                        category: DummyData.categories[index],
                      ),
                    ),
                  ),
                  child: CategoryCard(
                    height: index.isEven ? 180 : 200,
                    imagePath: DummyData.categories[index].imagePath,
                    title: DummyData.categories[index].title,
                    questionsCount: DummyData.questions
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

Widget _buildInfoItem({
  required String title,
  required String value,
  required String imagePath,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image(
        image: AssetImage(imagePath),
        height: 40.0,
        width: 40.0,
        fit: BoxFit.cover,
      ),
      const SizedBox(width: 15.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.tajawal(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: AppColors.charcoal,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            value,
            style: GoogleFonts.tajawal(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: AppColors.cyan,
            ),
          ),
        ],
      ),
    ],
  );
}
