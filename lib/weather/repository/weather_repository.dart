import 'package:dio/dio.dart';
import 'package:weather_now/weather/models/weather_model.dart';

class WeatherRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<WeatherModel> getWeather(String city) async {
    try {
      _dio.options.headers["Authorization"] =
          "4fbcf58cf5fd4cb8575fac8c55f438ed";
      final response = await _dio.get(
        "/weather",
        queryParameters: {
          "q": city,
          "appid": "4fbcf58cf5fd4cb8575fac8c55f438ed",
          "units": "metric",
        },
      );
      final res = response.data;

      return WeatherModel.fromJson(res);
    } catch (e) {
      throw Exception("Failed to get weather data : $e");
    }
  }
}
