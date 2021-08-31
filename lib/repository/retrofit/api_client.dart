import 'package:codeforces_visualizer/repository/api_model/data.dart';
import 'package:dio/dio.dart';
import 'package:codeforces_visualizer/repository/retrofit/apis.dart';
import 'package:retrofit/http.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: "https://codeforces.com/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.contests)
  Future<ResponseData> getContests();
}
