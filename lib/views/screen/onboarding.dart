import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_safe/core/constants/app_data.dart';
import 'package:travel_safe/views/screen/home_screen.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../core/constants/app_strings.dart';
import '../../core/helpers/responsive_helpers.dart';

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

  @override
  Widget build(BuildContext context) {
    double w(double px) => ResponsiveHelpers.w(context, px);
    double h(double px) => ResponsiveHelpers.h(context, px);
    bool isTabletLandScape = ResponsiveHelpers.isTabletLandscape(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: ResponsiveHelpers.screenPadding(context),

          child: Column(
            children: [
              Align(
                alignment: .topRight,
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

              SizedBox(height: 2.sp),

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

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: .center,
                children: List.generate(
                  AppData.onboardingData.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: w(4)),
                    width: w(20),
                    height: h(4),
                    decoration: BoxDecoration(
                      color: index <= _currentPage
                          ? AppColors.primary
                          : Colors.blue.shade200,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              !isTabletLandScape
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: w(16)),
                      child: Column(
                        crossAxisAlignment: .stretch,
                        mainAxisAlignment: .spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                            ),
                            child: Text(
                              AppStrings.btnLogin,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),

                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                color: AppColors.primary,
                                width: 1.5,
                              ),
                              elevation: 0,
                              backgroundColor: AppColors.white,
                            ),
                            child: Text(
                              AppStrings.btnCreateAccount,
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Row(
                      mainAxisAlignment: .spaceAround,
                      children: [
                        Spacer(),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                            ),
                            child: Text(
                              AppStrings.btnLogin,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),

                        Spacer(),

                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                color: AppColors.primary,
                                width: 1.5,
                              ),
                              elevation: 0,
                              backgroundColor: AppColors.white,
                            ),
                            child: Text(
                              AppStrings.btnCreateAccount,
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget onboardingData(BuildContext context, Map<String, String> item) {
  double w(double px) => ResponsiveHelpers.w(context, px);
  double h(double px) => ResponsiveHelpers.h(context, px);
  bool isTabletLandScape = ResponsiveHelpers.isTabletLandscape(context);

  return isTabletLandScape
      ? Row(
          mainAxisAlignment: .spaceAround,
          children: [
            SizedBox(
              height: .infinity,
              child: Image.asset(item['img']!, fit: .fitHeight),
            ),

            Column(
              spacing: h(5),
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                Text(
                  item['txt1']!,
                  style: TextStyle(fontFamily: 'JBold', fontSize: 24.sp),
                ),

                Stack(
                  alignment: .center,
                  children: [
                    SizedBox(
                      height: h(60),
                      width: w(180),
                      child: Image.asset(AppImages.img4, fit: .cover),
                    ),
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

                SizedBox(
                  width: w(300),
                  child: Text(
                    item['desc']!,
                    textAlign: .start,
                    style: TextStyle(fontSize: 18.sp, fontFamily: 'Lato'),
                  ),
                ),
              ],
            ),
          ],
        )
      : SingleChildScrollView(
          child: Column(
            children: [

              Image.asset(item['img']!),
              SizedBox(height: h(10)),
              Text(
                item['txt1']!,
                style: TextStyle(fontFamily: 'JBold', fontSize: 24.sp),
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

              SizedBox(height: h(10)),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w(48),
                  vertical: h(8),
                ),
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
