import 'package:flutter/material.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardRank extends StatelessWidget {
  final double width;
  final double height;
  final double opacity;
  final String name;
  final String avatar;
  final double avatarRadius;
  final double score;
  final int rank;
  final Color rankColor;

  const LeaderboardRank({
    super.key,
    required this.width,
    required this.height,
    required this.opacity,
    required this.name,
    required this.avatar,
    required this.avatarRadius,
    required this.score,
    required this.rank,
    required this.rankColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(opacity),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: GoogleFonts.tajawal(
                    color: AppColors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '$score',
                  style: GoogleFonts.tajawal(
                    color: AppColors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -50.0,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: rankColor,
                    width: 4.0,
                  ),
                ),
                child: CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: AssetImage(avatar),
                  backgroundColor: Colors.white,
                ),
              ),
              Positioned(
                bottom: -10.0,
                child: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: rankColor,
                  child: Text(
                    '$rank',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
