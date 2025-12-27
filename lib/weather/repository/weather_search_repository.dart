import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';

class WeatherSearchRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openweathermap.org/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<Either> searchCity(String query) async {
    try {
      _dio.options.headers["Authorization"] =
          "4fbcf58cf5fd4cb8575fac8c55f438ed";
      final response = await _dio.get(
        "/geo/1.0/direct",
        queryParameters: {
          "q": query,
          "limit": 5,
          "appid": "4fbcf58cf5fd4cb8575fac8c55f438ed",
        },
      );
      final res = response.data;
      print("res ==========================================> $res");
      return Right(res);
    } catch (e) {
      return Left('Failed to search city: $e');
    }
  }
}
