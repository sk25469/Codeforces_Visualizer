import 'dart:ui';

import 'package:charts_flutter/flutter.dart' as charts;

class ProblemDetailByTags implements Comparable {
  final String tag;
  final int quesCnt;
  final charts.Color color;

  ProblemDetailByTags(this.quesCnt, this.tag, Color color)
      : color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);

  @override
  int compareTo(other) {
    if (quesCnt < other.quesCnt) {
      return 1;
    }

    return 0;
  }
}
