import 'package:charts_flutter/flutter.dart' as charts;
import 'package:codeforces_visualizer/models/problem.dart';
import 'package:codeforces_visualizer/models/problem_detail_by_tags.dart';
import 'package:codeforces_visualizer/series/problem_rating_series.dart';
import 'package:codeforces_visualizer/series/problem_topic_series.dart';
import 'package:codeforces_visualizer/widgets/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:codeforces_visualizer/user.dart';

import 'package:codeforces_visualizer/models/problem_detail_by_rating.dart';

import '../problem_data.dart';

class UserInfoScreen extends StatelessWidget {
  static const routeName = '/user_info-screen';

  @override
  Widget build(BuildContext context) {
    String userName = User().getUserName();
    return _buildBody(context, userName);
  }
}

FutureBuilder<List<Problem>> _buildBody(BuildContext context, String userName) {
  return FutureBuilder<List<Problem>>(
    future: Problems(userName).fetchProblems(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final List<Problem>? posts = snapshot.data;
        // print("No. of problems are " + posts!.length.toString());
        return _buildCharts(posts);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

List<Problem> _getACProblems(List<Problem> problems) {
  List<Problem> solvedProblems = [];

  for (int i = 0; i < problems.length; i++) {
    if (problems[i].verdict == "OK") {
      solvedProblems.add(problems[i]);
    }
  }

  return solvedProblems;
}

class _buildCharts extends StatelessWidget {
  final List<Problem>? posts;
  _buildCharts(this.posts);

  @override
  Widget build(BuildContext context) {
    List<Problem> problemData = _getACProblems(posts!);

    List<ProblemDetailByRating> ratingData =
        ProblemData(problemData).getProblemDetailsByRating();
    List<ProblemDetailByTags> tagData =
        ProblemData(problemData).getProblemDetailsByTags();

    ratingData.sort((a, b) => a.compareTo(b));

    tagData.sort((a, b) => a.compareTo(b));

    var barChart = charts.BarChart(
      ProblemRatingSeries(ratingData).getSeries(),
      animate: true,
    );

    var pieChart = charts.PieChart(
      ProblemTopicSeries(tagData).getSeries(),
      animate: true,
    );

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Problem Rating of imSahil169',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Card(
          elevation: 5,
          borderOnForeground: true,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 200.0,
              width: double.maxFinite,
              child: barChart,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            'Tags of imSahil169',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        PieChart(pieChart, tagData),
      ],
    );
  }
}
