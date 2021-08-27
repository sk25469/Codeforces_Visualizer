import 'package:codeforces_visualizer/widgets/contest_details.dart';
import 'package:flutter/material.dart';

class ContestScreen extends StatelessWidget {
  const ContestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: (mediaQuery.size.height -
                    mediaQuery.padding.top -
                    mediaQuery.padding.bottom) *
                0.2,
            width: double.infinity,
            child: const Center(
              child: Text(
                'Upcoming Contests',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: (mediaQuery.size.height -
                    mediaQuery.padding.top -
                    mediaQuery.padding.bottom) *
                0.7,
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return const ContestDetail();
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
