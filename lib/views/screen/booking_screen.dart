import 'package:flutter/material.dart';
import 'package:travel_safe/core/constants/app_colors.dart';
import 'package:travel_safe/core/constants/app_images.dart';
import 'package:travel_safe/core/constants/app_strings.dart';
import '../../core/helpers/responsive_helpers.dart';

class BookingScreen extends StatelessWidget {
  final String name;

  const BookingScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    double w(double px) => ResponsiveHelpers.w(context, px);
    double h(double px) => ResponsiveHelpers.h(context, px);
    double sp(double px) => ResponsiveHelpers.sp(context, px);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [

            // Top Image
            SizedBox(
              width: .infinity,
              child: Image.asset(AppImages.maldivesDetails, fit: .cover),
            ),

            // Bottom Description box
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36),
                    ),
                    color: AppColors.white,
                  ),
                  child: Padding(
                    padding: ResponsiveHelpers.screenPadding(context),
                    child: Column(
                      crossAxisAlignment: .start,
                      spacing: sp(10),
                      children: [
                        Row(
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: .w600,
                                fontSize: sp(26),
                              ),
                            ),
                            Spacer(),
                            Text(
                              '\$85/Day',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: .w600,
                                fontSize: sp(22),
                              ),
                            ),
                          ],
                        ),

                        // Overview
                        Text(
                          AppStrings.overview,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontWeight: .w600,
                            fontSize: sp(18),
                            color: AppColors.primary,
                          ),
                        ),

                        Row(
                          children: [
                            Image.asset(AppImages.clockIcon, fit: .fitHeight),

                            Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  AppStrings.duration,
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: .bold,
                                    color: AppColors.grey,
                                  ),
                                ),

                                Text(
                                  '3 Days',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: .w600,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(width: sp(35)),

                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Image.asset(
                                AppImages.ratingIcon,
                                fit: .fitHeight,
                              ),
                            ),

                            Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text(
                                  AppStrings.ratingDetails,
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontWeight: .bold,
                                    color: AppColors.grey,
                                  ),
                                ),

                                Row(
                                  spacing: 8,
                                  children: [
                                    Text(
                                      '5.0',
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontWeight: .w600,
                                      ),
                                    ),

                                    Text(
                                      '(2.9k Reviews)',
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontWeight: .w600,
                                        fontSize: sp(10),
                                        color: AppColors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        // Description
                        Text(
                          AppStrings.maldivesDetails,
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: sp(13),
                            color: AppColors.grey,
                          ),
                        ),

                        SizedBox(height: h(4)),

                        Center(
                          child: SizedBox(
                            width: w(160),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                              ),
                              child: Text(
                                AppStrings.bookNow,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: sp(16),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Center(
                          child: SizedBox(
                            width: w(160),
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
                                AppStrings.moreDetails,
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: sp(16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: h(20),
              left: w(8),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
