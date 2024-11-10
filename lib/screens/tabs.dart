import 'package:flutter/material.dart';
import 'package:quiz/screens/home.dart';
import 'package:quiz/screens/leaderboard.dart';
import 'package:quiz/screens/profile.dart';
import 'package:quiz/screens/settings.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:quiz/utils/app_colors.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const Home(),
    const Leaderboard(),
    const Profile(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.gray,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            label: 'الرئيسية',
            icon: Icon(IconsaxPlusLinear.home_2),
            activeIcon: Icon(IconsaxPlusBold.home_2),
          ),
          BottomNavigationBarItem(
            label: 'لوحة المتصدرين',
            icon: Icon(IconsaxPlusLinear.cup),
            activeIcon: Icon(IconsaxPlusBold.cup),
          ),
          BottomNavigationBarItem(
            label: 'الحساب',
            icon: Icon(IconsaxPlusLinear.user),
            activeIcon: Icon(IconsaxPlusBold.user),
          ),
          BottomNavigationBarItem(
            label: 'الاعدادات',
            icon: Icon(IconsaxPlusLinear.setting_2),
            activeIcon: Icon(IconsaxPlusBold.setting_2),
          ),
        ],
      ),
    );
  }
}
