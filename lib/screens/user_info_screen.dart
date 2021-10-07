import 'package:charts_flutter/flutter.dart' as charts;
import 'package:codeforces_visualizer/models/problem.dart';
import 'package:codeforces_visualizer/models/problem_detail_by_tags.dart';
import 'package:codeforces_visualizer/series/problem_rating_series.dart';
import 'package:codeforces_visualizer/series/problem_topic_series.dart';
import 'package:codeforces_visualizer/widgets/pie_chart.dart';
import 'package:flutter/material.dart';

import 'package:codeforces_visualizer/models/problem_detail_by_rating.dart';

import '../problem_data.dart';

class UserInfoScreen extends StatelessWidget {
  static const routeName = '/user_info-screen';
  final String userName;

  UserInfoScreen(this.userName);

  @override
  Widget build(BuildContext context) {
    return _buildBody(context, userName);
  }
}

/// This returns a list of [Problem] which has a status of "OK"
FutureBuilder<List<Problem>> _buildBody(BuildContext context, String userName) {
  return FutureBuilder<List<Problem>>(
    future: Problems(userName).fetchProblems(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return AlertDialog(
          title: const Text('An error occurred'),
          content: const Text('Username not valid'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      } else if (snapshot.connectionState == ConnectionState.done) {
        final List<Problem>? posts = snapshot.data;
        // print("No. of problems are " + posts!.length.toString());
        return _buildCharts(posts, userName);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

/// This takes the series of the data to be represented
/// takes the userName and the list of problems
// ignore: camel_case_types

class _buildCharts extends StatelessWidget {
  final List<Problem>? posts;
  final String userName;
  _buildCharts(this.posts, this.userName);

  @override
  Widget build(BuildContext context) {
    List<ProblemDetailByRating> ratingData =
        ProblemData(posts!).getProblemDetailsByRating();
    List<ProblemDetailByTags> tagData = ProblemData(posts!).getProblemDetailsByTags();

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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Problem Rating of $userName',
            style: const TextStyle(
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
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            'Tags of $userName',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        PieChart(pieChart, tagData),
      ],
    );
  }
}
