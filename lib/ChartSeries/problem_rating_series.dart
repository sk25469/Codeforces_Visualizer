import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:codeforces_visualizer/models/problem_detail_by_rating.dart';

class ProblemRatingSeries {
  final List<ProblemDetailByRating> data;

  ProblemRatingSeries(this.data);

  List<Series<ProblemDetailByRating, String>> getSeries() {
    var series = [
      charts.Series(
        domainFn: (ProblemDetailByRating problemDetail, _) =>
            problemDetail.rating.toString(),
        measureFn: (ProblemDetailByRating problemDetail, _) =>
            problemDetail.quesCnt,
        colorFn: (something, _) => charts.Color.fromHex(code: "#800000"),
        id: 'Clicks',
        data: data,
      ),
    ];

    return series;
  }
}
