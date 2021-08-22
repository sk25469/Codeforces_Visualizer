import 'package:codeforces_visualizer/models/problem.dart';

class DummyData {
  final List<Problem> problemList = [
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
      rating: 1600,
      tags: ["data structures", "greedy", "sortings"],
      verdict: "OK",
    ),
  ];

  DummyData();
}
