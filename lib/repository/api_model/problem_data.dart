import 'package:codeforces_visualizer/repository/api_model/problem.dart';
import 'package:json_annotation/json_annotation.dart';
part 'problem_data.g.dart';

@JsonSerializable()
class Problem {
  final IndProblem indProblem;
  final String programmingLanguage;
  final String verdict;

  Problem({
    required this.indProblem,
    required this.programmingLanguage,
    required this.verdict,
  });

  factory Problem.fromJson(Map<String, dynamic> json) =>
      _$ProblemFromJson(json);
  Map<String, dynamic> toJson() => _$ProblemToJson(this);
}

@JsonSerializable()
class ProblemResponseData {
  String status;
  List<dynamic> result;

  ProblemResponseData({required this.result, required this.status});
  factory ProblemResponseData.fromJson(Map<String, dynamic> json) =>
      _$ProblemResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ProblemResponseDataToJson(this);
}
