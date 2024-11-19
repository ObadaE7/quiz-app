import 'package:flutter/material.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:figma_squircle/figma_squircle.dart';

class BadgeContainer extends StatelessWidget {
  final IconData icon;
  final int count;
  final String title;

  const BadgeContainer({
    super.key,
    required this.icon,
    required this.count,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 120.0,
      padding: const EdgeInsets.all(10.0),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 15.0,
            cornerSmoothing: 1,
          ),
        ),
        shadows: [
          BoxShadow(
            color: AppColors.charcoal.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 40.0,
            color: AppColors.cyan,
          ),
          const Spacer(),
          Text(
            '$count',
            style: GoogleFonts.tajawal(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: AppColors.charcoal,
            ),
          ),
          Text(
            title,
            style: GoogleFonts.tajawal(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: AppColors.mediumGray,
            ),
          )
        ],
      ),
    );
  }
}
