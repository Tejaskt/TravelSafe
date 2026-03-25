import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_safe/core/constants/app_images.dart';
import 'package:travel_safe/core/helpers/responsive_helpers.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

class Test extends StatefulWidget {
  final String name;

  const Test({super.key, required this.name});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool _isMoreDetailsClicked = false;

  final days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  @override
  Widget build(BuildContext context) {
    double w(double px) => ResponsiveHelpers.w(context, px);
    double h(double px) => ResponsiveHelpers.h(context, px);
    double sp(double px) => ResponsiveHelpers.sp(context, px);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),
            expandedHeight: ResponsiveHelpers.h(context, 400),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                AppImages.maldivesDetails,
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                  ),
                  color: AppColors.white,
                ),
                child: Padding(
                  padding: ResponsiveHelpers.screenPadding(context),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: .start,
                      spacing: sp(10),
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: .w600,
                                fontSize: sp(26),
                              ),
                            ),
                            Spacer(),
                            Text(
                              AppStrings.rate,
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
                                  AppStrings.stay,
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
                                      AppStrings.starts,
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontWeight: .w600,
                                      ),
                                    ),

                                    Text(
                                      AppStrings.reviews,
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
                                onPressed: () {
                                  setState(() {
                                    _isMoreDetailsClicked =
                                        !_isMoreDetailsClicked;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                    color: AppColors.primary,
                                    width: 1.5,
                                  ),
                                  elevation: 0,
                                  backgroundColor: AppColors.white,
                                ),
                                child: Text(
                                  !_isMoreDetailsClicked
                                      ? AppStrings.moreDetails
                                      : 'Less Details',
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

              if (_isMoreDetailsClicked)
                Padding(
                  padding: ResponsiveHelpers.screenPadding(context).copyWith(
                    top: 0
                  ),
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [

                      divider(),

                      Text(
                        AppStrings.details,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: sp(18),
                        ),
                      ),

                      divider(),

                      // address lines
                      address(Icons.location_on_outlined, AppStrings.address1),
                      address(Icons.map,AppStrings.website),

                      divider(),

                      Row(
                        spacing: w(8),
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            color: AppColors.primary,
                          ),
                          Text(
                            'Opening Hours',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              color: AppColors.black,
                              fontWeight: .w500,
                              fontSize: sp(18),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: h(8)),

                      // Days
                      Column(
                        children: days.map((day) => daysRow(day)).toList(),
                      ),

                      divider(),

                      /*
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            'Check in',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              color: AppColors.black,
                              fontSize: sp(16),
                            ),
                          ),

                          Text(
                            'Check out',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              color: AppColors.black,
                              fontSize: sp(16),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: BoxBorder.all(
                                  color: AppColors.primary,
                                  width: 1,
                                ),
                              ),
                              child: Text('Feb 06 ▼ Mon ▼'),
                            ),

                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: BoxBorder.all(
                                color: AppColors.primary,
                                width: 1,
                              ),
                            ),
                            child: Text('Feb 09 ▼ Wed ▼'),
                          ),
                        ],
                      ),

                       */
                    ],
                  ),
                ),
            ]),
          ),
        ],
      ),
    );
  }
}

Widget address(IconData icon, String address){
  return Row(
    spacing: 8,
    children: [
      Icon(
        icon,
        color: AppColors.primary,
      ),
      Text(
        address,
        style: TextStyle(
          fontFamily: 'Lato',
          color: AppColors.grey,
          fontSize: 16.sp,
        ),
      ),
    ],
  );
}

Widget divider(){
  return Divider(color: AppColors.black);
}

Widget daysRow(String day) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        day,
        style: TextStyle(fontFamily: 'Lato', fontSize: 16.sp),
      ),
      Text(
        '24 Hours',
        style: TextStyle(fontFamily: 'Lato', fontSize: 16.sp),
      ),
    ],
  );
}
