import 'dart:collection';

import 'package:codeforces_visualizer/models/problem.dart';

import 'models/problem_detail.dart';

class DummyData {
  static final List<Problem> problemList = [
    Problem(
      programmingLanguage: "GNU C++17",
      rating: 1500,
      tags: ["constructive algorithms", "math", "number theory"],
      verdict: "OK",
    ),
    Problem(
      programmingLanguage: "GNU C++17",
      rating: 1500,
      tags: ["dp", "greedy", "math", "sortings"],
      verdict: "OK",
    ),
    Problem(
      programmingLanguage: "GNU C++17",
      rating: 1600,
      tags: ["dfs and similar", "dsu", "graphs"],
      verdict: "OK",
    ),
    Problem(
      programmingLanguage: "GNU C++17",
      rating: 1200,
      tags: ["data structures", "greedy", "sortings"],
      verdict: "OK",
    ),
  ];

  final _quesCount = HashMap<int, int>();
  final List<ProblemDetail> _data = [];

  DummyData();

  void getQuesCount() {
    for (int i = 0; i < problemList.length; i++) {
      _quesCount[problemList[i].rating] = 0;
    }

    for (int i = 0; i < problemList.length; i++) {
      _quesCount[problemList[i].rating] =
          _quesCount[problemList[i].rating]! + 1;
    }
  }

  List<ProblemDetail> getProblemDetails() {
    getQuesCount();
    _quesCount.forEach((key, value) {
      _data.add(ProblemDetail(value, key));
    });
    return _data;
  }
}
