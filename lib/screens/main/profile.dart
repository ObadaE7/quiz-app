import 'package:flutter/material.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:quiz/widgets/badge_container.dart';
import 'package:quiz/widgets/bottom_wave_clipper.dart';
import 'package:quiz/widgets/top_wave_clipper.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:figma_squircle/figma_squircle.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> recentChallenges = [
    'الأحياء',
    'الرياضة',
  ];

  List<int> challengesScore = [
    85,
    92,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipPath(
                    clipper: TopWaveClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120.0,
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
                    ),
                  ),
                  ClipPath(
                    clipper: BottomWaveClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 130.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.cyan.withOpacity(0.5),
                            AppColors.darkCyan.withOpacity(0.5),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Container(
                      width: 120.0,
                      height: 120.0,
                      padding: const EdgeInsets.all(10.0),
                      decoration: ShapeDecoration(
                        color: AppColors.cyan.withOpacity(.1),
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 35.0,
                            cornerSmoothing: 1,
                          ),
                        ),
                      ),
                      child: Container(
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/avatars/avatar-1.png'),
                          ),
                          shape: SmoothRectangleBorder(
                            borderRadius: SmoothBorderRadius(
                              cornerRadius: 25.0,
                              cornerSmoothing: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'عبادة دراغمة',
                      style: GoogleFonts.tajawal(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.charcoal,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        'متحمس لاكتساب المعرفة وتحقيق التحديات!',
                        style: GoogleFonts.tajawal(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.mediumGray,
                        ),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BadgeContainer(
                          icon: HugeIcons.strokeRoundedQuiz04,
                          count: 25,
                          title: 'التحديات',
                        ),
                        SizedBox(width: 10.0),
                        BadgeContainer(
                          icon: HugeIcons.strokeRoundedStarCircle,
                          count: 1450,
                          title: 'النقاط',
                        ),
                        SizedBox(width: 10.0),
                        BadgeContainer(
                          icon: HugeIcons.strokeRoundedRanking,
                          count: 13,
                          title: 'المرتبة',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'التحديات الأخيرة',
                        style: GoogleFonts.tajawal(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.charcoal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: recentChallenges.length,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => Container(
                        decoration: ShapeDecoration(
                          shape: SmoothRectangleBorder(
                            borderRadius: SmoothBorderRadius(
                              cornerRadius: 15.0,
                              cornerSmoothing: 1,
                            ),
                          ),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          leading: const Icon(
                            HugeIcons.strokeRoundedQuiz05,
                            color: AppColors.cyan,
                          ),
                          title: Text(
                            recentChallenges[index],
                            style: GoogleFonts.tajawal(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.charcoal,
                            ),
                          ),
                          subtitle: Text(
                            'النقاط: ${challengesScore[index]}',
                            style: GoogleFonts.tajawal(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.mediumGray,
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10.0),
                    ),
                    const SizedBox(height: 10.0),
                  ],
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
