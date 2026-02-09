import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_now/weather/models/weather_info_model.dart';
import 'package:weather_now/weather/repository/weather_info_repository.dart';

part 'weather_info_state.dart';

class WeatherInfoCubit extends Cubit<WeatherInfoState> {
  WeatherInfoCubit() : super(WeatherInfoInitial());

  final WeatherRepository _repo = WeatherRepository();

  /// Fetches the weather information for the given city.
  ///
  /// Emits [WeatherInfoLoading] while the weather information is being fetched.
  /// If the weather information fetch fails, emits [WeatherInfoFailure] with the error message.
  /// If the weather information fetch succeeds, emits [WeatherInfoSuccess] with the weather information.
  ///
  /// [city] The name of the city to fetch the weather information for.
  ///
  Future<void> getWeather(String city) async {
    emit(WeatherInfoLoading());
    final res = await _repo.getWeather(city);
    res.fold(
      ifLeft: (value) {
        log("Api Error: $value");
        emit(WeatherInfoFailure(value));
      },
      ifRight: (value) {
        log("API Success: $value");
        emit(WeatherInfoSuccess(value));
      },
    );
  }
}
