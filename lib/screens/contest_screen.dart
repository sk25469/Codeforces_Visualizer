import 'package:codeforces_visualizer/widgets/contest_details.dart';
import 'package:flutter/material.dart';

class ContestScreen extends StatelessWidget {
  const ContestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return const ContestDetail();
        },
        itemCount: 1,
      ),
    );
  }
}
