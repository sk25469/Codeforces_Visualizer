import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable()
class Contest {
  final String name;
  final String phase;
  final DateTime startTime;
  final DateTime duration;

  Contest({
    required this.duration,
    required this.name,
    required this.phase,
    required this.startTime,
  });

  factory Contest.fromJson(Map<String, dynamic> json) =>
      _$ContestFromJson(json);
  Map<String, dynamic> toJson() => _$ContestToJson(this);
}

@JsonSerializable()
class ResponseData {
  int code;
  dynamic meta;
  List<dynamic> data;
  ResponseData({required this.code, this.meta, required this.data});
  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
