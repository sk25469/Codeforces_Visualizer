import 'package:codeforces_visualizer/screens/contest_screen.dart';
import 'package:codeforces_visualizer/screens/tabs_screen.dart';
import 'package:codeforces_visualizer/screens/user_info_screen.dart';
import 'package:codeforces_visualizer/screens/user_auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CF Visualizer',
      routes: {
        '/': (context) => const UserAuthScreen(),
        UserInfoScreen.routeName: (context) => const UserInfoScreen(),
        TabsScreen.routeName: (context) => TabsScreen(),
        ContestScreen.routeName: (context) => const ContestScreen(),
      },
    );
  }
}
