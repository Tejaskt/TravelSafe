import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_safe/core/constants/app_colors.dart';
import 'package:travel_safe/core/constants/app_images.dart';
import 'package:travel_safe/core/constants/app_strings.dart';
import 'package:travel_safe/views/screen/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: .topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 6.w, top: 3.h),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => HomeScreen()),
                      );
                    },
                    child: Text(
                      AppStrings.skip,
                      style: TextStyle(
                        fontFamily: 'JMedium',
                        fontSize: 18.sp,
                        color: AppColors.black,
                        fontWeight: .w500,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 2.h),

              SizedBox(
                height: 47.h,
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: .spaceEvenly,
                      children: [
                        Image.asset(AppImages.img1),
                        Image.asset(AppImages.img2),
                      ],
                    ),

                    Align(
                      alignment: .bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            width: 270,
                            AppImages.img3,
                          ),
                          SizedBox(
                            width: 270,
                            child: Text(
                              AppStrings.discoverAmazing,
                              style: TextStyle(
                                fontFamily: 'JBold',
                                fontSize: 24.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Stack(
                alignment: .center,
                children: [
                  Image.asset(AppImages.img4),
                  Text(
                    AppStrings.destinations,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 22.sp,
                      fontFamily: 'JBold',
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 8.0,
                ),
                child: Text(
                  AppStrings.onBoardingDesc,
                  textAlign: .start,
                  style: TextStyle(fontSize: 18.sp, fontFamily: 'Lato'),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 1.h),
                child: Row(
                  spacing: 5,
                  children: [
                    Image.asset(AppImages.dot1),
                    Image.asset(AppImages.dot2),
                    Image.asset(AppImages.dot2),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  width: 75.w,
                  height: 5.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    child: Text(
                      AppStrings.btnLogin,
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: 75.w,
                height: 5.h,

                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: AppColors.primary),
                    elevation: 0,
                    backgroundColor: AppColors.white,
                  ),
                  child: Text(
                   AppStrings.btnCreateAccount,
                    style: TextStyle(color: AppColors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
