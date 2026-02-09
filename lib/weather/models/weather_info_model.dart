class WeatherInfoModel {
  final Location location;
  final CurrentWeather current;
  final Forecast forecast;

  WeatherInfoModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherInfoModel.fromJson(Map<String, dynamic> json) {
    return WeatherInfoModel(
      location: Location.fromJson(json['location']),
      current: CurrentWeather.fromJson(json['current']),
      forecast: Forecast.fromJson(json['forecast']),
    );
  }
}

class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
      tzId: json['tz_id'],
      localtime: json['localtime'],
    );
  }
}

class CurrentWeather {
  final double tempC;
  final double tempF;
  final int isDay;
  final WeatherCondition condition;
  final double windKph;
  final int humidity;
  final double feelslikeC;

  CurrentWeather({
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windKph,
    required this.humidity,
    required this.feelslikeC,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      tempC: json['temp_c'].toDouble(),
      tempF: json['temp_f'].toDouble(),
      isDay: json['is_day'],
      condition: WeatherCondition.fromJson(json['condition']),
      windKph: json['wind_kph'].toDouble(),
      humidity: json['humidity'],
      feelslikeC: json['feelslike_c'].toDouble(),
    );
  }
}

class WeatherCondition {
  final String text;
  final String icon;

  WeatherCondition({required this.text, required this.icon});

  factory WeatherCondition.fromJson(Map<String, dynamic> json) {
    return WeatherCondition(text: json['text'], icon: json['icon']);
  }
}

class Forecast {
  final List<ForecastDay> forecastday;

  Forecast({required this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    var list = json['forecastday'] as List;
    List<ForecastDay> days = list.map((i) => ForecastDay.fromJson(i)).toList();
    return Forecast(forecastday: days);
  }
}

class ForecastDay {
  final String date;
  final Day day;
  final List<Hour> hour;

  ForecastDay({required this.date, required this.day, required this.hour});

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    var list = json['hour'] as List;
    List<Hour> hours = list.map((i) => Hour.fromJson(i)).toList();
    return ForecastDay(
      date: json['date'],
      day: Day.fromJson(json['day']),
      hour: hours,
    );
  }
}

class Day {
  final double maxtempC;
  final double mintempC;
  final WeatherCondition condition;

  Day({
    required this.maxtempC,
    required this.mintempC,
    required this.condition,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxtempC: json['maxtemp_c'].toDouble(),
      mintempC: json['mintemp_c'].toDouble(),
      condition: WeatherCondition.fromJson(json['condition']),
    );
  }
}

class Hour {
  final String time;
  final double tempC;
  final WeatherCondition condition;

  Hour({required this.time, required this.tempC, required this.condition});

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      time: json['time'],
      tempC: json['temp_c'].toDouble(),
      condition: WeatherCondition.fromJson(json['condition']),
    );
  }
}
