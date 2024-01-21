import 'package:flutter/material.dart';
import 'package:loginsignup/Pages/habit_page.dart';
import 'package:loginsignup/Pages/setting_page.dart';
import 'package:loginsignup/Pages/story_page.dart';
import 'Pages/home_page.dart';
import 'Pages/community_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/community': (context) => CommunityPage(),
        '/setting': (context) => SettingPage(),
        '/habit': (context) => HabitPage(),
        '/story' : (context) => StoryPage(),
       // '/story' : (context)
      },
    );
  }
}
