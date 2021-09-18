import 'package:json_annotation/json_annotation.dart';
part 'problem_data.g.dart';

@JsonSerializable()
class Problem {
  final int rating;
  final List<String> tags;
  final String programmingLanguage;
  final String verdict;

  Problem({
    required this.programmingLanguage,
    required this.rating,
    required this.tags,
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
