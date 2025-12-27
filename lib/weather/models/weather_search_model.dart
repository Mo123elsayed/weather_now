class WeatherSearchModel {
  final String name;
  final double lat;
  final double lon;
  final String country;
  final String? state;
  final Map<String, String>? localNames;

  WeatherSearchModel({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    this.state,
    this.localNames,
  });

  factory WeatherSearchModel.fromJson(Map<String, dynamic> json) {
    return WeatherSearchModel(
      name: json['name'],
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      country: json['country'],
      state: json['state'],
      localNames: json['local_names'] != null
          ? Map<String, String>.from(json['local_names'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lat': lat,
      'lon': lon,
      'country': country,
      'state': state,
      'local_names': localNames,
    };
  }
}
