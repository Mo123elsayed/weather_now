part of 'weather_info_cubit.dart';

sealed class WeatherInfoState extends Equatable {
  const WeatherInfoState();

  @override
  List<Object> get props => [];
}

final class WeatherInfoInitial extends WeatherInfoState {}

final class WeatherInfoLoading extends WeatherInfoState {}

final class WeatherInfoFailure extends WeatherInfoState {
  final message;
  const WeatherInfoFailure(this.message);
}

final class WeatherInfoSuccess extends WeatherInfoState {
  final WeatherInfoModel weatherResult;
  const WeatherInfoSuccess(this.weatherResult);
}
