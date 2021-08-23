import 'dart:collection';

import 'package:codeforces_visualizer/models/problem_detail_by_tags.dart';
import 'package:codeforces_visualizer/tag_colors.dart';
import 'package:flutter/material.dart';

import './models/problem.dart';

import 'models/problem_detail_by_rating.dart';

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

  final _quesCountByRating = HashMap<int, int>();
  final _quesCountByTopic = HashMap<String, int>();
  final List<ProblemDetailByRating> _ratingData = [];
  final List<ProblemDetailByTags> _tagData = [];

  DummyData();

  void _getQuesCountByTopic() {
    for (int i = 0; i < problemList.length; i++) {
      for (int j = 0; j < problemList[i].tags.length; j++) {
        _quesCountByTopic[problemList[i].tags[j]] = 0;
      }
    }

    for (int i = 0; i < problemList.length; i++) {
      for (int j = 0; j < problemList[i].tags.length; j++) {
        _quesCountByTopic[problemList[i].tags[j]] =
            _quesCountByTopic[problemList[i].tags[j]]! + 1;
      }
    }
  }

  void _getQuesCountByRating() {
    for (int i = 0; i < problemList.length; i++) {
      _quesCountByRating[problemList[i].rating] = 0;
    }

    for (int i = 0; i < problemList.length; i++) {
      _quesCountByRating[problemList[i].rating] =
          _quesCountByRating[problemList[i].rating]! + 1;
    }
  }

  List<ProblemDetailByRating> getProblemDetailsByRating() {
    _getQuesCountByRating();
    _quesCountByRating.forEach((key, value) {
      _ratingData.add(ProblemDetailByRating(value, key));
    });
    return [..._ratingData];
  }

  List<ProblemDetailByTags> getProblemDetailsByTags() {
    _getQuesCountByTopic();
    _quesCountByTopic.forEach((key, value) {
      _tagData
          .add(ProblemDetailByTags(value, key, TagColors.colors[key] as Color));
    });
    return [..._tagData];
  }
}
