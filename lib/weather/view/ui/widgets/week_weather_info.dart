import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_now/core/theme/app_text_style.dart';

class WeekWeatherInfo extends StatelessWidget {
  const WeekWeatherInfo({super.key, required this.days});
  final List days;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            height: 150.h,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: days.length,
              itemBuilder: (context, index) {
                final d = days[index];
                return Container(
                  width: 70,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        d.date, // 18:00
                        style: const TextStyle(color: Colors.white),
                      ),
                      Image.network(
                        "https:${d.day.condition.icon.replaceAll('64x64', '128x128')}",
                        width: 40.w,
                      ),
                      Text(
                        "${d.day.mintempC.toInt()}°",
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
