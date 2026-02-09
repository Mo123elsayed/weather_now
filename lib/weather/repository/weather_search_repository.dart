import 'dart:developer';

import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:weather_now/weather/models/weather_search_model.dart';

class WeatherSearchRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.weatherapi.com/v1/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<Either> searchCity(String query) async {
    try {
      final response = await _dio.get(
        "search.json",
        queryParameters: {"q": query, "key": "76e1472be19e4c77a17152123261601"},
      );
      final res = response.data;
      final List<WeatherSearchModel> searchResults =
          WeatherSearchModel.fromJsonList(res);
      log("Search Results =======> $searchResults");
      log("Search Results Type =========> ${searchResults.runtimeType}");
      return Right(searchResults);
    } catch (e) {
      return Left('Failed to search city: $e');
    }
  }
}
