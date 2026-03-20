import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_safe/core/constants/app_colors.dart';
import 'package:travel_safe/core/constants/app_images.dart';
import 'package:travel_safe/core/constants/app_strings.dart';

import '../../core/helpers/responsive_helpers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double w(double px) => ResponsiveHelpers.w(context, px);
    double h(double px) => ResponsiveHelpers.h(context, px);
    double sp(double px) => ResponsiveHelpers.sp(context, px);
    bool isTablet = ResponsiveHelpers.isTablet(context);
    bool isTabletLandScape = ResponsiveHelpers.isTabletLandscape(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: AppColors.primary),
        unselectedIconTheme: IconThemeData(color: AppColors.black),
        backgroundColor: Colors.transparent,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email_rounded),
            label: AppStrings.chat,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: AppStrings.schedule,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: AppStrings.saved,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: AppStrings.profile,
          ),
        ],
      ),

      backgroundColor: AppColors.white,

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: ResponsiveHelpers.screenPadding(context),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    CircleAvatar(backgroundImage: AssetImage(AppImages.avatar)),
                    SizedBox(width: w(8)),

                    Text(
                      AppStrings.userName,
                      style: TextStyle(fontFamily: 'Lato', fontSize: sp(18)),
                    ),

                    Spacer(),

                    Card(
                      shape: CircleBorder(),
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(AppImages.setting),
                      ),
                    ),
                    Card(
                      shape: CircleBorder(),
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(AppImages.bell),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: h(10)),

                Text(
                  AppStrings.heading1,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: sp(24),
                    fontWeight: .w600,
                    color: AppColors.black,
                  ),
                ),

                Text(
                  AppStrings.heading2,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: sp(24),
                    fontWeight: .w600,
                    color: AppColors.orange,
                  ),
                ),

                SizedBox(height: h(20)),

                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: .stretch,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(Icons.search_rounded),
                            hintText: AppStrings.search,
                            border: OutlineInputBorder(
                              borderRadius: .circular(50),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: w(20)),

                      Card(
                        shape: CircleBorder(),
                        color: AppColors.white,
                        child: Image.asset(AppImages.filter),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: h(16)),

                smallHeadings(AppStrings.visit, context),

                SizedBox(height: h(16)),

                SizedBox(
                  height: sp(100),
                  child: ListView.builder(
                    scrollDirection: .horizontal,
                    itemCount: AppStrings.cityName.length,
                    itemBuilder: (context, index) =>
                        cityView(AppStrings.cityName[index], context),
                  ),
                ),

                SizedBox(height: h(10)),

                Row(
                  children: [
                    smallHeadings(AppStrings.popularDestination, context),
                    Spacer(),
                    Text(
                      AppStrings.seeAll,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: AppColors.blue,
                        fontSize: sp(14)
                      ),
                    ),
                  ],
                ),

                SizedBox(height: h(14)),

                SingleChildScrollView(
                  scrollDirection: .horizontal,
                  child: Row(
                    children: [
                      popularDestinationCard(
                        AppImages.maldives,
                        AppStrings.cardTitle1,
                        AppStrings.address1,
                        4.6,
                        context
                      ),
                      SizedBox(width: w(12)),
                      popularDestinationCard(
                        AppImages.erinFalls,
                        AppStrings.cardTitle2,
                        AppStrings.address2,
                        3,
                        context
                      ),
                    ],
                  ),
                ),

                SizedBox(height: h(35)),

                Row(
                  children: [
                    smallHeadings(AppStrings.category, context),
                    Spacer(),
                    Text(
                      AppStrings.seeAll,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: AppColors.blue,
                        fontSize: sp(14)
                      ),
                    ),
                  ],
                ),

                SizedBox(height: h(24)),

                Row(
                  mainAxisAlignment: .spaceAround,
                  children: [
                    categoryView(AppImages.beach, AppStrings.beach),
                    categoryView(AppImages.mountain, AppStrings.mountain),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget popularDestinationCard(
  String img,
  String title,
  String location,
  double rating,
    BuildContext context
) {
  return Container(
    height: ResponsiveHelpers.h(context, 200),
    width: ResponsiveHelpers.w(context, 200),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      image: DecorationImage(image: AssetImage(img), fit: .cover),
    ),
    child: Stack(
      children: [
        // top-right arrow icon
        Positioned(
          top: 20,
          right: 14,
          child: SvgPicture.asset(AppImages.arrowIcon),
        ),

        // bottom text  + rating
        Positioned(
          bottom: 10,
          left: 20,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.only(left: 14, top: 4, bottom: 4),
            child: Column(
              spacing: 1,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),

                // Location row
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 12,
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        location,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 10.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                // Star rating row
                Row(
                  children: [
                    ...List.generate(5, (index) {
                      return Icon(
                        index < rating.floor() ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 12,
                      );
                    }),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: .w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget categoryView(String img, String name) {
  return Container(
    decoration: BoxDecoration(
      border: .all(color: AppColors.primary),
      borderRadius: .circular(50),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8.w),
      child: Row(
        children: [
          Image.asset(img, scale: 3),
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: .w600,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget smallHeadings(String txt, BuildContext context) {
  return Text(
    txt,
    style: TextStyle(
      fontFamily: 'Lato',
      fontWeight: .w600,
      fontSize: ResponsiveHelpers.sp(context, 18),
    ),
  );
}

Widget cityView(Map<String, String> value, BuildContext context) {
  return Column(
    mainAxisAlignment: .center,
    children: [
      Container(
        height: ResponsiveHelpers.sp(context, 65),
        width: ResponsiveHelpers.sp(context, 90),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(value['image']!),
            fit: .cover,
          ),
          shape: .circle,
        ),
      ),
      Text(
        value['city']!,
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: ResponsiveHelpers.sp(context, 14),
        ),
      ),
    ],
  );
}
