import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_now/core/theme/app_text_style.dart';
import 'package:weather_now/weather/cubits/weather_info_cubit/weather_info_cubit.dart';
import 'package:weather_now/weather/models/weather_search_model.dart';
import 'package:weather_now/weather/view/ui/widgets/daily_weather_info.dart';
import 'package:weather_now/weather/view/ui/widgets/weather_humidity_container.dart';
import 'package:weather_now/weather/view/ui/widgets/weather_info_background_container.dart';
import 'package:weather_now/weather/view/ui/widgets/weather_windSpeed_container.dart';
import 'package:weather_now/weather/view/ui/widgets/week_weather_info.dart';

class WeatherResultScreen extends StatefulWidget {
  const WeatherResultScreen({super.key});

  @override
  State<WeatherResultScreen> createState() => _WeatherResultScreenState();
}

class _WeatherResultScreenState extends State<WeatherResultScreen> {
  @override
  /// Builds a widget that displays the weather information of a given city.
  ///
  /// The widget fetches the weather information of the given city using the [WeatherInfoCubit].
  /// It then displays the weather information in a user-friendly format.
  ///
  /// The [WeatherInfoCubit] is provided by the [BlocProvider] above this widget in the widget tree.
  /// The [BlocProvider] is configured to create a new [WeatherInfoCubit] when this widget is created.
  ///
  /// The [WeatherInfoCubit] is given the city name to fetch the weather information as an argument.
  /// The city name is passed to the [BlocProvider] above this widget in the widget tree.
  ///
  /// The widget displays a spinner while the weather information is being fetched.
  /// If the weather information fetch fails, the widget displays an error message.
  /// If the weather information fetch succeeds, the widget displays the weather information in a user-friendly format.
  Widget build(BuildContext context) {
    final rawArgs =
        ModalRoute.of(context)?.settings.arguments as WeatherSearchModel;

    return BlocProvider(
      create: (context) => WeatherInfoCubit()
        ..getWeather(rawArgs.name), // Pass the city name to fetch weather info
      child: Scaffold(
        body: BlocConsumer<WeatherInfoCubit, WeatherInfoState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is WeatherInfoLoading) {
              return AlertDialog(
                content: const Center(child: CircularProgressIndicator()),
              );
            }
            if (state is WeatherInfoFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: AppTextStyle.poppinsWhite20.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            if (state is WeatherInfoSuccess) {
              final bool isDay = state.weatherResult.current.isDay == 1;
              final weatherPerHour =
                  state.weatherResult.forecast.forecastday[0].hour;
              final weatherDays = state.weatherResult.forecast.forecastday;
              final weatherHumidity = state.weatherResult.current.humidity;
              final weatherWindspd = state.weatherResult.current.windKph;
              // final weatherFeelsLike = state.weatherResult.forecast.forecastday[0].day.;

              /// Return the weather information screen with the fetched weather data
              return WeatherInfoBackgroundContainer(
                isDay: isDay,
                containerChild: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              state.weatherResult.location.name,
                              style: AppTextStyle.poppinsWhite20.copyWith(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: AppTextStyle.poppinsWhite20.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 70.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        "${(state.weatherResult.current.tempC.round())}",
                                  ),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(0, -60),
                                      child: Text(
                                        "°C",
                                        style: AppTextStyle.poppinsWhite20
                                            .copyWith(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CachedNetworkImage(
                              height: 160.h,
                              imageUrl:
                                  "https:${state.weatherResult.current.condition.icon}",
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        Text(
                          state.weatherResult.current.condition.text,
                          style: AppTextStyle.poppinsWhite20.copyWith(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 35.h),
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_upward_rounded,
                              color: Colors.white,
                            ),
                            Text(
                              "${state.weatherResult.forecast.forecastday[0].day.maxtempC.round()}°",
                              style: AppTextStyle.poppinsWhite20.copyWith(
                                fontSize: 18.sp,
                              ),
                            ),
                            SizedBox(width: 5.h),
                            Text(
                              '/',
                              style: AppTextStyle.poppinsWhite20.copyWith(
                                fontSize: 18.sp,
                              ),
                            ),
                            SizedBox(width: 5.h),
                            const Icon(
                              Icons.arrow_downward_rounded,
                              color: Colors.white,
                            ),
                            Text(
                              "${state.weatherResult.forecast.forecastday[0].day.mintempC.round()}°",
                              style: AppTextStyle.poppinsWhite20.copyWith(
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Feels like ${state.weatherResult.current.feelslikeC.round()}°',
                          style: AppTextStyle.poppinsWhite20.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(20, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: DailyWeatherInfo(hours: weatherPerHour),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(20, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: WeekWeatherInfo(days: weatherDays),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: WeatherHumidityContainer(
                                weatherHumidity: weatherHumidity,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              flex: 1,
                              child: WeatherWindspeedContainer(
                                windSpeed: weatherWindspd,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Updated ${DateFormat("d MMM, h:mm a").format(DateTime.now())}',
                          style: AppTextStyle.poppinsWhite20.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const SizedBox.shrink(); // Return an empty widget if the state is not handled
          },
        ),
      ),
    );
  }
}
