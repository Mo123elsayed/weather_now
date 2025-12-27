import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_now/weather/repository/weather_search_repository.dart';

part 'weather_search_state.dart';

class WeatherSearchCubit extends Cubit<WeatherSearchState> {
  WeatherSearchCubit() : super(WeatherSearchState.initial());

  final WeatherSearchRepository _repo = WeatherSearchRepository();

  Future<void> searchCity(String city) async {
    final res = await _repo.searchCity(city);
    emit(WeatherSearchLoading());
    res.fold(
      ifLeft: (value) => emit(WeatherSearchFailure(value)),
      ifRight: (result) {
        if (result.isEmpty) {
          emit(WeatherSearchEmpty());
        } else {
          emit(WeatherSearchSuccess(result));
        }
      },
    );
    // Handle the response as needed
  }

  void clearResults() {
  emit(WeatherSearchEmpty());
}

}
