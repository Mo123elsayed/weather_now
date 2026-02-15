part of 'weather_search_cubit.dart';

@immutable
sealed class WeatherSearchState {
  static WeatherSearchState initial() => WeatherSearchInitial();
}

final class WeatherSearchInitial extends WeatherSearchState {}
final class WeatherSearchIdle extends WeatherSearchState {}

final class WeatherSearchLoading extends WeatherSearchState {}

final class WeatherSearchFailure extends WeatherSearchState {
  final String message;
  WeatherSearchFailure(this.message);
}

final class WeatherSearchEmpty extends WeatherSearchState {}

final class WeatherSearchSuccess extends WeatherSearchState {
  final List<WeatherSearchModel> searchResults;
  WeatherSearchSuccess(this.searchResults);
}
