import 'package:flutter/material.dart';
import 'package:quiz/screens/login.dart';
import 'package:quiz/widgets/bottom_wave_clipper.dart';
import 'package:quiz/widgets/top_wave_clipper.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _navigateToLoginScreen();
  }

  void _navigateToLoginScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  List<IconData> settingsIcon = [
    HugeIcons.strokeRoundedResetPassword,
    HugeIcons.strokeRoundedMail02,
    HugeIcons.strokeRoundedUserRemove01,
    HugeIcons.strokeRoundedLogout03,
  ];

  List<String> settingsTitle = [
    'تغيير كلمة المرور',
    'تغيير البريد الإلكتروني',
    'الغاء الحساب',
    'تسجيل الخروج',
  ];

  List<String> settingsSubTitle = [
    'إعداد كلمة المرور الجديدة',
    'قم بتحديث بريدك الإلكتروني',
    'حذف حسابك بشكل دائم',
    'تسجيل الخروج من حسابك',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                          Color(0xFF3EB8D4),
                          Color(0xFF1F8DA6),
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
                          const Color(0xFF3EB8D4).withOpacity(0.5),
                          const Color(0xFF1F8DA6).withOpacity(0.5),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'الإعدادات',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListView.separated(
                    itemCount: settingsTitle.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 80.0,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: ShapeDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          shape: SmoothRectangleBorder(
                            borderRadius: SmoothBorderRadius(
                              cornerRadius: 25.0,
                              cornerSmoothing: 1.0,
                            ),
                          ),
                        ),
                        child: ListTile(
                          leading: Icon(settingsIcon[index]),
                          title: Text(settingsTitle[index]),
                          subtitle: Text(settingsSubTitle[index]),
                          titleTextStyle: const TextStyle(
                            fontSize: 16.0,
                            color: AppColors.charcoal,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitleTextStyle: const TextStyle(
                            fontSize: 14.0,
                            color: AppColors.gray,
                            fontWeight: FontWeight.w500,
                          ),
                          trailing: const Icon(
                            HugeIcons.strokeRoundedArrowLeft01,
                            color: AppColors.charcoal,
                          ),
                          contentPadding: EdgeInsets.zero,
                          onTap: () {
                            switch (index) {
                              case 0:
                                // Change Password
                                break;
                              case 1:
                                // Change Email
                                break;
                              case 2:
                                // Delete Account
                                break;
                              case 3:
                                _logout();
                                break;
                            }
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFFAFAFA),
    );
  }
}
