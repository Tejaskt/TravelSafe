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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (value) {},
        selectedItemColor: AppColors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.home),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.message),
            label: AppStrings.chat,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.calender),
            label: AppStrings.schedule,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.favorite),
            label: AppStrings.saved,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppImages.profile),
            label: AppStrings.profile,
          ),
        ],
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: .start,
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

                SizedBox(height: 10),

                Text(
                  AppStrings.heading1,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 22.sp,
                    fontWeight: .w600,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  AppStrings.heading2,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 22.sp,
                    fontWeight: .w600,
                    color: AppColors.orange,
                  ),
                ),

                SizedBox(height: 15),

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

                      SizedBox(width: 3.w),
                      Card(
                        shape: CircleBorder(),
                        color: AppColors.white,
                        child: Image.asset(AppImages.filter),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 8),

                smallHeadings(AppStrings.visit),

                SizedBox(height: 8),

                SizedBox(
                  height: 10.h,
                  child: ListView.builder(
                    scrollDirection: .horizontal,
                    itemCount: AppStrings.cityName.length,
                    itemBuilder: (context, index) =>
                        cityView(AppStrings.cityName[index]),
                  ),
                ),

                Row(
                  children: [
                    smallHeadings(AppStrings.popularDestination),
                    Spacer(),
                    Text(
                      AppStrings.seeAll,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: AppColors.blue,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                SingleChildScrollView(
                  scrollDirection: .horizontal,
                  child: Row(
                    spacing: 20,
                    children: [
                      popularDestinationCard(AppImages.maldives,AppStrings.cardTitle1,AppStrings.address1,4.6),
                      popularDestinationCard(AppImages.erinFalls,AppStrings.cardTitle2,AppStrings.address2,3),
                    ],
                  ),
                ),
                SizedBox(height: 10),


                SizedBox(height: 15),
                Row(
                  children: [
                    smallHeadings(AppStrings.category),
                    Spacer(),
                    Text(
                      AppStrings.seeAll,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: AppColors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),


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

Widget popularDestinationCard(String img, String title, String location, double rating) {
  return Container(
    height: 200,
    width: 200,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(20),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [

          //Background Image
          Positioned.fill(
            child: Image.asset(
              img,
              fit: BoxFit.cover,
            ),
          ),

          //Bottom dark gradient overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.7),
                  ],
                ),
              ),
            ),
          ),

          // Top-right arrow icon
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.arrow_outward,
                size: 16,
                color: Colors.black,
              ),
            ),
          ),

          // Bottom text + rating
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Title
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),

                // Location row
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.white, size: 12),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        location,
                        style: const TextStyle(color: Colors.white70, fontSize: 11),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Star rating row
                Row(
                  children: [
                    ...List.generate(5, (index) {
                      return Icon(
                        index < rating.floor() ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 14,
                      );
                    }),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),

              ],
            ),
          ),

        ],
      ),
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

Widget smallHeadings(String txt) {
  return Text(
    txt,
    style: TextStyle(fontFamily: 'Lato', fontWeight: .w600, fontSize: 18.sp),
  );
}

Widget cityView(Map<String, String> value) {
  return Column(
    mainAxisAlignment: .center,
    spacing: 5,
    children: [
      Container(
        height: 60,
        width: 90,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(value['image']!),
            fit: .cover,
          ),
          shape: .circle,
        ),
      ),
      Text(value['city']!, style: TextStyle(fontFamily: 'Lato')),
    ],
  );
}
