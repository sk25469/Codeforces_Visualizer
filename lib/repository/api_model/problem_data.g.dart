// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Problem _$ProblemFromJson(Map<String, dynamic> json) {
  return Problem(
    programmingLanguage: json['programmingLanguage'] as String,
    rating: json['rating'] as int,
    tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    verdict: json['verdict'] as String,
  );
}

Map<String, dynamic> _$ProblemToJson(Problem instance) => <String, dynamic>{
      'rating': instance.rating,
      'tags': instance.tags,
      'programmingLanguage': instance.programmingLanguage,
      'verdict': instance.verdict,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) {
  return ResponseData(
    result: json['result'] as List<dynamic>,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
