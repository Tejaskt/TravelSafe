import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_safe/core/constants/app_data.dart';
import 'package:travel_safe/views/screen/home_screen.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../core/constants/app_strings.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    if (_currentPage < AppData.onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToHome();
    }
  }

  void _goToHome() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    //final isLastPage = _currentPage == AppData.onboardingData.length - 1;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
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

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: AppData.onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = AppData.onboardingData[index];
                  return onboardingData(context, item);
                },
              ),
            ),

            Row(
              mainAxisAlignment: .center,
              children: List.generate(
                AppData.onboardingData.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 20 : 8,
                  //  active dot is wider
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? AppColors.primary
                        : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
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
    );
  }
}

Widget onboardingData(BuildContext context, Map<String, String> item) {
  return SingleChildScrollView(
    child: Column(
      children: [

        SizedBox(
          height: 47.h,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Image.asset(item['img1']!),
                  Image.asset(item['img2']!),
                ],
              ),

              Align(
                alignment: .bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(width: 270, item['img3']!),
                    SizedBox(
                      width: 270,
                      child: Text(
                        item['txt1']!,
                        style: TextStyle(fontFamily: 'JBold', fontSize: 24.sp),
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
              item['txt2']!,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 22.sp,
                fontFamily: 'JBold',
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 8.0),
          child: Text(
            item['desc']!,
            textAlign: .start,
            style: TextStyle(fontSize: 18.sp, fontFamily: 'Lato'),
          ),
        ),

      ],
    ),
  );
}
