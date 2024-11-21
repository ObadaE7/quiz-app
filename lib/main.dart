import 'package:flutter/material.dart';
import 'package:quiz/screens/auth/login.dart';
import 'package:quiz/screens/auth/register.dart';
import 'package:quiz/screens/main/home.dart';
import 'package:quiz/screens/main/leaderboard.dart';
import 'package:quiz/screens/main/profile.dart';
import 'package:quiz/screens/main/settings.dart';
import 'package:quiz/screens/main/tabs.dart';
// import 'screens/quiz/finish_quiz.dart';
// import 'screens/quiz/my_quiz.dart';
// import 'screens/quiz/start_quiz.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Login(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        // '/forgot-password': (context) => ForgotPassword(),
        '/tabs': (context) => const Tabs(),
        '/settings': (context) => const Settings(),
        '/leaderboard': (context) => const Leaderboard(),
        '/profile': (context) => const Profile(),
        '/home': (context) => const Home(),
        // '/start-quiz': (context) => StartQuiz(),
        // '/my-quiz': (context) => MyQuiz(),
        // '/finish-quiz': (context) => FinishQuiz(),
      },
    );
  }
}
