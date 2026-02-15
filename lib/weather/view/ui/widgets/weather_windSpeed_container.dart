import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_now/core/theme/app_text_style.dart';

class WeatherWindspeedContainer extends StatelessWidget {
  final double windSpeed;

  const WeatherWindspeedContainer({super.key, required this.windSpeed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10.h,
        left: 10.w,
        right: 10.w,
        bottom: 10.h,
      ),
      width: 150.w,
      height: 160.h,
      decoration: BoxDecoration(
        color: Color.fromARGB(20, 0, 0, 0),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Icon(Icons.air_outlined, color: Colors.white),
                SizedBox(width: 5.w),
                Text(
                  'Wind Speed',
                  style: AppTextStyle.poppinsWhite20.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
          // SizedBox(height: 62.h),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 8.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  "${windSpeed} km/h",
                  style: AppTextStyle.poppinsWhite20.copyWith(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
