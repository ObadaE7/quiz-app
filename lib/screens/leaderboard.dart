import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/dummy_data.dart';
import 'package:quiz/utils/app_colors.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  width: MediaQuery.of(context).size.width,
                  height: 400.0,
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
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      const Positioned(
                        top: -50.0,
                        right: -100.0,
                        child: CirclePlaceholder(radius: 100.0),
                      ),
                      Column(
                        children: [
                          Text(
                            'لوحة المتصدرين',
                            style: GoogleFonts.tajawal(
                              color: AppColors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Container(
                            width: 327.0,
                            height: 53.0,
                            decoration: ShapeDecoration(
                              color: AppColors.white,
                              shape: SmoothRectangleBorder(
                                borderRadius: SmoothBorderRadius(
                                  cornerRadius: 16.0,
                                  cornerSmoothing: 1.0,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ButtonRankedBy(
                                  onPressed: () {},
                                  text: 'شهرياً',
                                ),
                                ButtonRankedBy(
                                  onPressed: () {},
                                  text: 'هذا الإسبوع',
                                ),
                                ButtonRankedBy(
                                  onPressed: () {},
                                  text: 'كل الأوقات',
                                  isButtonActive: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // First rank
                Positioned(
                  bottom: 30.0,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      LeaderboardRank(
                        width: 108.0,
                        height: 152.0,
                        opacity: 0.2,
                        name: DummyData.leaderboard[0].name,
                        avatar: DummyData.leaderboard[0].avatar,
                        avatarRadius: 40.0,
                        score: DummyData.leaderboard[0].score,
                        rank: 1,
                        rankColor: const Color(0xFFFFD000),
                      ),
                      const Positioned(
                        top: -95,
                        child: Image(
                          image: AssetImage('assets/animations/crown.png'),
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                    ],
                  ),
                ),
                // Second rank
                Positioned(
                  bottom: 20.0,
                  left: MediaQuery.of(context).size.width * 0.09,
                  child: LeaderboardRank(
                    width: 92.0,
                    height: 132.0,
                    opacity: 0.1,
                    name: DummyData.leaderboard[1].name,
                    avatar: DummyData.leaderboard[1].avatar,
                    avatarRadius: 30.0,
                    score: DummyData.leaderboard[1].score,
                    rank: 2,
                    rankColor: const Color(0xFF3ED4A1),
                  ),
                ),
                // Third rank
                Positioned(
                  bottom: 20.0,
                  right: MediaQuery.of(context).size.width * 0.09,
                  child: LeaderboardRank(
                    width: 92.0,
                    height: 132.0,
                    opacity: 0.1,
                    name: DummyData.leaderboard[2].name,
                    avatar: DummyData.leaderboard[2].avatar,
                    avatarRadius: 30.0,
                    score: DummyData.leaderboard[2].score,
                    rank: 3,
                    rankColor: const Color(0xFFFF9F41),
                  ),
                ),
                //  Bottom rounded shape
                const Positioned(
                  bottom: -950.0,
                  child: CircleAvatar(
                    radius: 500,
                    backgroundColor: Color(0xFFfafafa),
                  ),
                ),
                // Circles
                const Positioned(
                  top: -50.0,
                  left: 20.0,
                  child: CirclePlaceholder(radius: 50.0),
                ),
                const Positioned(
                  bottom: 170.0,
                  left: 10.0,
                  child: CirclePlaceholder(radius: 20.0),
                ),
                const Positioned(
                  bottom: 210.0,
                  left: 70.0,
                  child: CirclePlaceholder(radius: 10.0),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                child: ListView.separated(
                  // Return the top 10 user without first 3
                  shrinkWrap: true,
                  itemCount: DummyData.leaderboard.length - 6,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    int rankStarted = index + 3;
                    return ListTileLeaderboard(
                      rank: DummyData.leaderboard[rankStarted].rank,
                      name: DummyData.leaderboard[rankStarted].name,
                      avatar: DummyData.leaderboard[rankStarted].avatar,
                      score: DummyData.leaderboard[rankStarted].score,
                    );
                  },
                  separatorBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFFAFAFA),
    );
  }
}

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

class ButtonRankedBy extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isButtonActive;

  const ButtonRankedBy({
    super.key,
    required this.text,
    required this.onPressed,
    this.isButtonActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          isButtonActive ? AppColors.primary : Colors.transparent,
        ),
        foregroundColor: WidgetStatePropertyAll(
          isButtonActive ? AppColors.white : AppColors.gray,
        ),
        shape: WidgetStatePropertyAll(
          SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 13.0,
              cornerSmoothing: 1.0,
            ),
          ),
        ),
      ),
      child: Text(text),
    );
  }
}

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
          color: AppColors.primary,
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

class CirclePlaceholder extends StatelessWidget {
  final double radius;
  final double? opacity;

  const CirclePlaceholder({
    super.key,
    required this.radius,
    this.opacity = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white.withOpacity(opacity!),
    );
  }
}
