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
class ResponseData {
  String status;
  List<dynamic> result;

  ResponseData({required this.result, required this.status});
  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
