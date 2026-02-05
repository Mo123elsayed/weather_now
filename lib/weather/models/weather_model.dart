class WeatherModel {
  final String cityName;
  final String country;

  final double lat;
  final double lon;

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;

  final int pressure;
  final int humidity;
  final int visibility;

  final String weatherMain;
  final String weatherDescription;
  final String weatherIcon;

  final double windSpeed;
  final int windDeg;

  final int cloudiness;

  final int sunrise;
  final int sunset;

  WeatherModel({
    required this.cityName,
    required this.country,
    required this.lat,
    required this.lon,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.visibility,
    required this.weatherMain,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.windSpeed,
    required this.windDeg,
    required this.cloudiness,
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      country: json['sys']['country'],

      lat: (json['coord']['lat'] as num).toDouble(),
      lon: (json['coord']['lon'] as num).toDouble(),

      temp: (json['main']['temp'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      tempMin: (json['main']['temp_min'] as num).toDouble(),
      tempMax: (json['main']['temp_max'] as num).toDouble(),

      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'], 
      visibility: json['visibility'],

      weatherMain: json['weather'][0]['main'],
      weatherDescription: json['weather'][0]['description'],
      weatherIcon: json['weather'][0]['icon'],

      windSpeed: (json['wind']['speed'] as num).toDouble(),
      windDeg: json['wind']['deg'],

      cloudiness: json['clouds']['all'],

      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'country': country,
      'lat': lat,
      'lon': lon,
      'temp': temp,
      'feelsLike': feelsLike,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'visibility': visibility,
      'weatherMain': weatherMain,
      'weatherDescription': weatherDescription,
      'weatherIcon': weatherIcon,
      'windSpeed': windSpeed,
      'windDeg': windDeg,
      'cloudiness': cloudiness,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }
}
