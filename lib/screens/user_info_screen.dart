import 'dart:collection';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:codeforces_visualizer/dummy_data.dart';
import 'package:codeforces_visualizer/models/problem_detail.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProblemDetail> data = DummyData().getProblemDetails();

    var series = [
      charts.Series(
        domainFn: (ProblemDetail problemDetail, _) =>
            problemDetail.rating.toString(),
        measureFn: (ProblemDetail problemDetail, _) => problemDetail.quesCnt,
        colorFn: (something, _) => charts.Color.fromHex(code: "#800000"),
        id: 'Clicks',
        data: data,
      ),
    ];

    var barChart = charts.BarChart(
      series,
      animate: false,
    );

    var pieChart = charts.PieChart(
      series,
      animate: false,
    );

    var barChartWidget = Padding(
      padding: const EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: barChart,
      ),
    );

    var pieChartWidget = Padding(
      padding: const EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: pieChart,
      ),
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
                child: barChartWidget,
              ),
              Card(
                elevation: 5,
                shadowColor: const Color.fromRGBO(255, 10, 10, 50),
                borderOnForeground: true,
                child: pieChartWidget,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
