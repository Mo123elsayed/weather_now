import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_now/core/services/local_storage.dart';
import 'package:weather_now/core/theme/app_text_style.dart';
import 'package:weather_now/weather/cubits/weather_info_cubit/weather_info_cubit.dart';
import 'package:weather_now/weather/view/ui/widgets/daily_weather_info.dart';
import 'package:weather_now/weather/view/ui/widgets/hourly_weather_info.dart';
import 'package:weather_now/weather/view/ui/widgets/weather_humidity_container.dart';
import 'package:weather_now/weather/view/ui/widgets/weather_info_background_container.dart';
import 'package:weather_now/weather/view/ui/widgets/weather_windSpeed_container.dart';


class WeatherInfoWidget extends StatefulWidget {
  const WeatherInfoWidget({super.key});

  @override
  State<WeatherInfoWidget> createState() => _WeatherInfoWidgetState();
}

class _WeatherInfoWidgetState extends State<WeatherInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherInfoCubit, WeatherInfoState>(
          listener: (context, state) async {
            // TODO: implement listener
            if (state is WeatherInfoSuccess) {
              await LocalStorage.saveCity(state.weatherResult.location.name);
            }
          },
          builder: (context, state) {
            if (state is WeatherInfoLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is WeatherInfoFailure) {
              return AlertDialog(
                title: const Text('Error'),
                icon: const Icon(
                  Icons.error_outline_rounded,
                  color: Colors.red,
                ),
                content: Text(
                  state.message,
                  style: AppTextStyle.poppinsWhite20.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
                              height: 170.h,
                              imageUrl:
                                  "https:${state.weatherResult.current.condition.icon}",
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        Text(
                          state.weatherResult.current.condition.text,
                          style: AppTextStyle.poppinsWhite20.copyWith(
                            fontSize: 25.sp,
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
                          child: HourlyWeatherInfo(hours: weatherPerHour),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(20, 0, 0, 0),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: DailyWeatherInfo(days: weatherDays),
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
        );
  }
}