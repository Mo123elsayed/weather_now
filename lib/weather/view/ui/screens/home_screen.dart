import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_now/core/helpers/extensions.dart';
import 'package:weather_now/core/routing/routes.dart';
import 'package:weather_now/core/theme/app_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            fit: BoxFit.cover,
            'assets/imgs/weather_app_bg.jpg',
            height: double.infinity,
            width: double.infinity,
            // fit: BoxFit.cover,
            cacheHeight: 192,
            cacheWidth: 192,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                // opacity: ,
                'assets/imgs/weather-bg.png',
                height: 150.h,
                width: 150.w,
                fit: BoxFit.cover,
                cacheHeight: 192,
                cacheWidth: 192,
              ),
              SizedBox(
                width: 250.w,
                child: Text(
                  "Welcome to Weather Now 🌤️",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.poppinsWhite20.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                  ),
                ),
              ),
              Text(
                'Check the weather anywhere, easily.',
                style: AppTextStyle.quicksandWhite20,
              ),
              SizedBox(height: 20.h),

              /// Get Started Button
              Container(
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.white, width: 2.w),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.blueAccent],
                  ),
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: TextButton(
                  onPressed: () {
                    context.pushNamed(Routes.searchScreen);
                  },
                  child: const Text(
                    "Check Weather",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10.h,

            child: Text(
              "Simple weather. Anytime.",
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: 'Quicksand',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
