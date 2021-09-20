import 'package:charts_flutter/flutter.dart' as charts;
import 'package:codeforces_visualizer/models/problem_detail_by_tags.dart';
import 'package:codeforces_visualizer/repository/api_model/problem_data.dart';
import 'package:codeforces_visualizer/repository/retrofit/api_client.dart';
import 'package:codeforces_visualizer/series/problem_rating_series.dart';
import 'package:codeforces_visualizer/series/problem_topic_series.dart';
import 'package:codeforces_visualizer/widgets/pie_chart.dart';
import '../models/problem.dart' as accepted_problem;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:codeforces_visualizer/models/problem_detail_by_rating.dart';

import '../problem_data.dart';

class UserInfoScreen extends StatelessWidget {
  static const routeName = '/user_info-screen';
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}

FutureBuilder<ProblemResponseData> _buildBody(BuildContext context) {
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  return FutureBuilder<ProblemResponseData>(
    future: client.getUserStatus(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final ProblemResponseData? posts = snapshot.data;
        // print(posts!.result.length);
        // print(posts!.result[0]['problem']['rating']);
        return _buildCharts(posts);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

List<accepted_problem.Problem> _getACProblems(ProblemResponseData? posts) {
  List<accepted_problem.Problem> problemData = [];
  for (int i = 0; i < posts!.result.length; i++) {
    if (posts!.result[i]['verdict'] == 'OK') {
      List<String> problemTags = [];
      for (int j = 0; j < posts.result[i]['problem']['tags'].length; j++) {
        problemTags.add(posts.result[i]['problem']['tags'][j]);
      }
      problemData.add(accepted_problem.Problem(
          programmingLanguage: posts!.result[i]['programmingLanguage'],
          rating: posts.result[i]['problem']['rating'],
          tags: problemTags,
          verdict: posts.result[i]['verdict']));
    }
  }

  return problemData;
}

class _buildCharts extends StatelessWidget {
  final ProblemResponseData? posts;
  _buildCharts(this.posts);

  @override
  Widget build(BuildContext context) {
    List<accepted_problem.Problem> problemData = _getACProblems(posts);

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
