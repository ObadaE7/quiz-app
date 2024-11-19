import 'package:flutter/material.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:figma_squircle/figma_squircle.dart';

class ListTileLeaderboard extends StatelessWidget {
  final int rank;
  final String name;
  final String avatar;
  final double score;

  const ListTileLeaderboard({
    super.key,
    required this.rank,
    required this.name,
    required this.avatar,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '$rank',
        style: GoogleFonts.tajawal(
          color: AppColors.charcoal,
          fontSize: 16.0,
        ),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundImage: AssetImage(avatar),
          ),
          const SizedBox(width: 10.0),
          Text(
            name,
            style: GoogleFonts.tajawal(
              color: AppColors.charcoal,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      trailing: Text(
        '$score',
        style: GoogleFonts.tajawal(
          color: AppColors.cyan,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      tileColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      shape: SmoothRectangleBorder(
        borderRadius: SmoothBorderRadius(
          cornerRadius: 16.0,
        ),
      ),
    );
  }
}
