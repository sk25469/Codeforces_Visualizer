import 'package:charts_flutter/flutter.dart';
import 'package:codeforces_visualizer/models/problem_detail_by_tags.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ProblemTopicSeries {
  final List<ProblemDetailByTags> data;

  ProblemTopicSeries(this.data);

  List<Series<ProblemDetailByTags, String>> getSeries() {
    var series = [
      charts.Series(
        domainFn: (ProblemDetailByTags problemDetail, _) => problemDetail.tag,
        measureFn: (ProblemDetailByTags problemDetail, _) =>
            problemDetail.quesCnt,
        colorFn: (ProblemDetailByTags problemDetail, _) => problemDetail.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    return series;
  }
}
