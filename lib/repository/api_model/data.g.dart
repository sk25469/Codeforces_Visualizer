// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contest _$ContestFromJson(Map<String, dynamic> json) {
  return Contest(
    duration: DateTime.parse(json['duration'] as String),
    name: json['name'] as String,
    phase: json['phase'] as String,
    startTime: DateTime.parse(json['startTime'] as String),
  );
}

Map<String, dynamic> _$ContestToJson(Contest instance) => <String, dynamic>{
      'name': instance.name,
      'phase': instance.phase,
      'startTime': instance.startTime.toIso8601String(),
      'duration': instance.duration.toIso8601String(),
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) {
  return ResponseData(
    code: json['code'] as int,
    meta: json['meta'],
    data: json['data'] as List<dynamic>,
  );
}

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'meta': instance.meta,
      'data': instance.data,
    };
