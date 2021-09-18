// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contest _$ContestFromJson(Map<String, dynamic> json) {
  return Contest(
    duration: json['duration'] as int,
    name: json['name'] as String,
    phase: json['phase'] as String,
    startTime: json['startTime'] as int,
  );
}

Map<String, dynamic> _$ContestToJson(Contest instance) => <String, dynamic>{
      'name': instance.name,
      'phase': instance.phase,
      'startTime': instance.startTime,
      'duration': instance.duration,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) {
  return ResponseData(
    status: json['status'] as String,
    result: json['result'] as List<dynamic>,
  );
}

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
