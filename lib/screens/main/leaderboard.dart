import 'package:flutter/material.dart';
import 'package:quiz/widgets/bottom_curved_clip_path.dart';
import 'package:quiz/widgets/button_ranked_by.dart';
import 'package:quiz/widgets/leaderboard_rank.dart';
import 'package:quiz/widgets/list_tile_leaderboard.dart';
import 'package:quiz/widgets/circle_placeholder.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:quiz/data/dummy_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:figma_squircle/figma_squircle.dart';

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
                ClipPath(
                  clipper: BottomCurvedClipper(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    width: MediaQuery.of(context).size.width,
                    height: 400.0,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.cyan,
                          AppColors.darkCyan,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                  bottom: 10.0,
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
                  bottom: 10.0,
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
      backgroundColor: AppColors.offWhite,
    );
  }
}
