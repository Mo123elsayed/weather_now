import 'package:cached_network_image/cached_network_image.dart';
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatDayLabel(d.date),
                        style: AppTextStyle.quicksandWhite20.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: "https:${d.day.condition.icon}",
                            width: 40.w,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 20.w),
                          Text(
                            "${d.day.maxtempC.round()}°",
                            style: AppTextStyle.quicksandWhite20.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20.w),

                          Text(
                            "${d.day.mintempC.round()}°",
                            style: AppTextStyle.quicksandWhite20.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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

  String formatDayLabel(String dateString) {
    final date = DateTime.parse(dateString);
    final now = DateTime.now();

    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(date.year, date.month, date.day);

    final diff = target.difference(today).inDays;

    if (diff == 0) {
      return 'Today';
    } else if (diff == 1) {
      return 'Tomorrow';
    } else {
      return DateFormat('EE').format(date); // Monday, Tuesday...
    }
  }
}
