import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable()
class Contest {
  final String name;
  final String phase;
  final int startTime;
  final int duration;

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
  String status;
  List<dynamic> result;
  ResponseData({required this.status, required this.result});
  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
