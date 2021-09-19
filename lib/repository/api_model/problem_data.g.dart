// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Problem _$ProblemFromJson(Map<String, dynamic> json) {
  return Problem(
    indProblem: IndProblem.fromJson(json['indProblem'] as Map<String, dynamic>),
    programmingLanguage: json['programmingLanguage'] as String,
    verdict: json['verdict'] as String,
  );
}

Map<String, dynamic> _$ProblemToJson(Problem instance) => <String, dynamic>{
      'indProblem': instance.indProblem,
      'programmingLanguage': instance.programmingLanguage,
      'verdict': instance.verdict,
    };

ProblemResponseData _$ProblemResponseDataFromJson(Map<String, dynamic> json) {
  return ProblemResponseData(
    result: json['result'] as List<dynamic>,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$ProblemResponseDataToJson(
        ProblemResponseData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
