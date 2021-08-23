import 'package:charts_flutter/flutter.dart' as charts;
import 'package:codeforces_visualizer/ChartSeries/problem_rating_series.dart';
import 'package:codeforces_visualizer/ChartSeries/problem_topic_series.dart';
import 'package:codeforces_visualizer/models/problem_detail_by_tags.dart';
import 'package:codeforces_visualizer/widgets/chart.dart';
import 'package:flutter/material.dart';

import 'package:codeforces_visualizer/dummy_data.dart';
import 'package:codeforces_visualizer/models/problem_detail_by_rating.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProblemDetailByRating> ratingData =
        DummyData().getProblemDetailsByRating();
    List<ProblemDetailByTags> tagData = DummyData().getProblemDetailsByTags();

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
        Container(
          child: Column(
            children: [
              Card(
                elevation: 5,
                shadowColor: const Color.fromRGBO(255, 10, 10, 50),
                borderOnForeground: true,
                child: Chart(barChart),
              ),
              Card(
                elevation: 5,
                shadowColor: const Color.fromRGBO(255, 10, 10, 50),
                borderOnForeground: true,
                child: Chart(pieChart),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
