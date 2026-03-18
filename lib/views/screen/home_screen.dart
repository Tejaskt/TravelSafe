import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_safe/core/constants/app_colors.dart';
import 'package:travel_safe/core/constants/app_images.dart';
import 'package:travel_safe/core/constants/app_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundImage: AssetImage(AppImages.avatar)),
                  Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: Text(
                      AppStrings.userName,
                      style: TextStyle(fontFamily: 'Lato', fontSize: 18.sp),
                    ),
                  ),
                  Spacer(),
                  Card(
                    shape: CircleBorder(),
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.settings),
                    )
                  ),Card(
                    shape: CircleBorder(),
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.notifications_none),
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
