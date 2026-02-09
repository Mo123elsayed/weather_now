import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:weather_now/weather/models/weather_info_model.dart';

class WeatherRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.weatherapi.com/v1/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  /// Fetches the weather information for the given city.
  ///
  /// Emits [WeatherInfoLoading] while the weather information is being fetched.
  /// If the weather information fetch fails, emits [WeatherInfoFailure] with the error message.
  /// If the weather information fetch succeeds, emits [WeatherInfoSuccess] with the weather information.
  ///
  /// [city] The name of the city to fetch the weather information for.
  Future<Either> getWeather(String city) async {
    try {
      final response = await _dio.get(
        "/forecast.json",
        queryParameters: {
          "q": city,
          "key": "76e1472be19e4c77a17152123261601",
          "days": 7,
          "aqi": "no",
          "alerts": "no",
        },
      );
      /// fetch the API data and store it in a variable
      final res = response.data;

      /// serialize the response data into WeatherInfoModel
      final finalResult = WeatherInfoModel.fromJson(res);
      return Right(finalResult);
    } catch (e) {
      return Left("Failed to get weather data : $e");
    }
  }
}
