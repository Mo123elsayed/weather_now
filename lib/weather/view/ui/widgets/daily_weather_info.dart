import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_now/core/theme/app_text_style.dart';

class DailyWeatherInfo extends StatelessWidget {
  final List hours;
  const DailyWeatherInfo({super.key, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: SizedBox(
            height: 150.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hours.length,
              itemBuilder: (context, index) {
                final h = hours[index];
                return Container(
                  width: 70,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        formatTo12Hour(h.time),
                        style: AppTextStyle.poppinsWhite20.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CachedNetworkImage(
                        fit: BoxFit.cover,
                        height: 40.h,
                        imageUrl: "https:${h.condition.icon}",
                        width: 40.w,
                      ),
                      Text(
                        "${h.tempC.toInt()}°",
                        style: AppTextStyle.quicksandWhite20.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  String formatTo12Hour(String time) {
    final dt = DateTime.parse(time);
    return DateFormat('h:mm a').format(dt);
  }
}
