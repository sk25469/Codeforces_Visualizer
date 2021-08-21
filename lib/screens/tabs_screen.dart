import 'package:codeforces_visualizer/screens/contest_screen.dart';
import 'package:codeforces_visualizer/screens/user_info_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Codeforces Visualizer'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.calendar_view_month,
                ),
                text: 'Contests',
              ),
              Tab(
                icon: Icon(
                  Icons.query_stats,
                ),
                text: 'Stats',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            ContestScreen(),
            UserInfoScreen(),
          ],
        ),
      ),
    );
  }
}
