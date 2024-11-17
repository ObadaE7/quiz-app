import 'package:flutter/material.dart';
import 'package:quiz/screens/home.dart';
import 'package:quiz/screens/leaderboard.dart';
import 'package:quiz/screens/profile.dart';
import 'package:quiz/screens/settings.dart';
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
        // showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            label: 'الرئيسية',
            icon: Image(
              image: AssetImage('assets/icons/home.png'),
              height: 35.0,
              width: 35.0,
            ),
          ),
          BottomNavigationBarItem(
            label: 'لوحة المتصدرين',
            icon: Image(
              image: AssetImage('assets/icons/podium.png'),
              height: 35.0,
              width: 35.0,
            ),
          ),
          BottomNavigationBarItem(
            label: 'ملفي الشخصي',
            icon: Image(
              image: AssetImage('assets/icons/prince.png'),
              height: 35.0,
              width: 35.0,
            ),
          ),
          BottomNavigationBarItem(
            label: 'الإعدادات',
            icon: Image(
              image: AssetImage('assets/icons/settings.png'),
              height: 35.0,
              width: 35.0,
            ),
          ),
        ],
      ),
    );
  }
}
