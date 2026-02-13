import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:weather_now/core/theme/app_text_style.dart';

class WeatherHumidityContainer extends StatelessWidget {
  final int weatherHumidity;
  const WeatherHumidityContainer({super.key, required this.weatherHumidity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      width: 150.w,
      height: 150.h,
      decoration: BoxDecoration(
        color: Color.fromARGB(20, 0, 0, 0),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              spacing: 5.w,
              children: [
                Icon(Icons.water_drop_outlined, color: Colors.white),
                SizedBox(width: 5.w),
                Text(
                  'Humidity',
                  style: AppTextStyle.poppinsWhite20.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          CircularPercentIndicator(
            radius: 50.0,
            lineWidth: 5.0,
            percent: weatherHumidity / 100, // لازم من 0 → 1
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.water_drop, color: Colors.white),
                Text(
                  "${weatherHumidity}%",
                  style: AppTextStyle.poppinsWhite20.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            progressColor: Colors.blue,
            backgroundColor: Color.fromARGB(100, 0, 0, 0),
            circularStrokeCap: CircularStrokeCap.round,
            animation: true,
            animationDuration: 800,
          ),
        ],
      ),
    );
  }
}
