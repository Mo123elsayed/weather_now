class WeatherSearchModel {
  final int id;
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String url;

  WeatherSearchModel({
    required this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.url,
  });

  factory WeatherSearchModel.fromJson(Map<String, dynamic> json) {
    return WeatherSearchModel(
      id: json['id'] as int,
      name: json['name'] as String,
      region: json['region'] ?? '',
      country: json['country'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      url: json['url'] as String,
    );
  }

  /// Converts a list of JSON objects into a list of [WeatherSearchModel] objects.
  ///
  /// The input list is expected to contain JSON objects with the same structure
  /// as the ones returned by the OpenWeatherMap API.
  ///
  /// The function returns a list of [WeatherSearchModel] objects that can be used
  /// to display the search results.
  ///
  /// Throws a [FormatException] if the input list contains objects that are not
  /// valid JSON representations of [WeatherSearchModel] objects.
  static List<WeatherSearchModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((e) => WeatherSearchModel.fromJson(e))
        .toList();
  }
}
