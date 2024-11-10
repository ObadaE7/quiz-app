import 'package:flutter/material.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:figma_squircle/figma_squircle.dart';

class Category extends StatelessWidget {
  final String imagePath;
  final String title;
  final int questionCount;

  const Category({
    super.key,
    required this.imagePath,
    required this.title,
    required this.questionCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          decoration: ShapeDecoration(
            shape: SmoothRectangleBorder(
              borderRadius: SmoothBorderRadius(
                cornerRadius: 35.0,
                cornerSmoothing: 1,
              ),
            ),
            color: AppColors.white,
            shadows: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: GoogleFonts.tajawal(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.charcoal,
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 3,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
              ),
              Text(
                '$questionCount عدد الاسئلة',
                style: GoogleFonts.tajawal(
                  fontSize: 16.0,
                  color: AppColors.gray,
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -20.0,
          right: 20,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 40,
                  offset: const Offset(0, 30),
                  spreadRadius: -10,
                ),
              ],
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
