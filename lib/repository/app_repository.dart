import 'package:dio/dio.dart';
import 'package:codeforces_visualizer/repository/retrofit/api_client.dart';

class AppRepository {
  ApiClient? apiRequest;
  Dio? dio;

  AppRepository() {
    dio = Dio();
    apiRequest = ApiClient(dio!);
  }
}
