class WeatherModel {
  final String cityName;

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;

  final int humidity;
  final int pressure;

  final String weatherMain;
  final String weatherDescription;
  final String weatherIcon;

  final double windSpeed;
  final int cloudiness;

  WeatherModel({
    required this.cityName,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.pressure,
    required this.weatherMain,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.windSpeed,
    required this.cloudiness,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    double toCelsius(num kelvin) => kelvin - 273.15;

    return WeatherModel(
      cityName: json['name'],

      temp: toCelsius(json['main']['temp']),
      feelsLike: toCelsius(json['main']['feels_like']),
      tempMin: toCelsius(json['main']['temp_min']),
      tempMax: toCelsius(json['main']['temp_max']),

      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],

      weatherMain: json['weather'][0]['main'],
      weatherDescription: json['weather'][0]['description'],
      weatherIcon: json['weather'][0]['icon'],

      windSpeed: (json['wind']['speed'] as num).toDouble(),
      cloudiness: json['clouds']['all'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'temp': temp,
      'feelsLike': feelsLike,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'humidity': humidity,
      'pressure': pressure,
      'weatherMain': weatherMain,
      'weatherDescription': weatherDescription,
      'weatherIcon': weatherIcon,
      'windSpeed': windSpeed,
      'cloudiness': cloudiness,
    };
  }
}
