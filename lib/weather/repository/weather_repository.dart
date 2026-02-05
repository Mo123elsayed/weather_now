import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';

class WeatherRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.weatherapi.com/v1/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<Either> getWeather(String city) async {
    try {
      final response = await _dio.get(
        "/forecast.json",
        queryParameters: {
          "q": city,
          "appid": "76e1472be19e4c77a17152123261601",
          "units": "metric",
          "days": 7,
          "aqi": "no",
          "alerts": "no",
        },
      );
      final res = response.data;
      print("res =======================================> : $res");
      return Right(res);
    } catch (e) {
      return Left("Failed to get weather data : $e");
    }
  }
}
