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
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            height: 140,
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
                        formatTo12Hour(h.time), // 18:00
                        style: const TextStyle(color: Colors.white),
                      ),
                      Image.network("https:${h.condition.icon}", width: 40.w),
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
        SizedBox(height: 20.h),
      ],
    );
  }

  String formatTo12Hour(String time) {
    final dt = DateTime.parse(time);
    return DateFormat('h:mm a').format(dt);
  }
}
