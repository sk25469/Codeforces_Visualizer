import 'package:charts_flutter/flutter.dart' as charts;
import 'package:codeforces_visualizer/models/problem_detail_by_tags.dart';
import 'package:codeforces_visualizer/series/problem_rating_series.dart';
import 'package:codeforces_visualizer/series/problem_topic_series.dart';
import 'package:codeforces_visualizer/widgets/pie_chart.dart';
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
              child: barChart,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            'Tags of imSahil169',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                alignment: Alignment.centerLeft,
                width: 230,
                height: 250,
                child: Card(
                  elevation: 5,
                  borderOnForeground: true,
                  child: PieChart(pieChart),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                width: 135,
                height: 220,
                child: const Card(
                  elevation: 5,
                  borderOnForeground: true,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Legends',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
