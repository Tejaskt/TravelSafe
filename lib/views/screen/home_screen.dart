import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_safe/core/constants/app_colors.dart';
import 'package:travel_safe/core/constants/app_images.dart';
import 'package:travel_safe/core/constants/app_strings.dart';
import 'package:travel_safe/views/screen/booking_screen.dart';
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

    // Height of the two heading texts — tweak if your font renders taller/shorter
    final double headingsHeight = h(70);

    // Height of the search bar row — tweak to match your actual render height
    final double searchBarHeight = h(56);

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
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // SLIVER 1 — Pinned top row  +  collapsible / fading headings
            //  • title        → always pinned (avatar, name, settings, bell)
            //  • flexibleSpace → the two heading Texts fade out on scroll
            SliverAppBar(
              backgroundColor: AppColors.white,
              surfaceTintColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              pinned: true,
              automaticallyImplyLeading: false,
              // Extra space below the toolbar for the headings
              expandedHeight: kToolbarHeight + headingsHeight,
              titleSpacing: 0,

              // ── Always-visible top row ───────────────────────────────────
              title: Padding(
                padding: ResponsiveHelpers.screenPadding(context)
                    .copyWith(top: 0, bottom: 0),
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundImage: AssetImage(AppImages.avatar)),
                    SizedBox(width: w(8)),
                    Text(
                      AppStrings.userName,
                      style: TextStyle(
                          fontFamily: 'Lato', fontSize: sp(18)),
                    ),
                    const Spacer(),

                    // Settings
                    Card(
                      shape: const CircleBorder(),
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(AppImages.setting),
                      ),
                    ),

                    // Bell with badge
                    Stack(
                      children: [
                        Card(
                          shape: const CircleBorder(),
                          color: AppColors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(AppImages.bell),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: CircleAvatar(
                            maxRadius: 8,
                            backgroundColor: AppColors.primary,
                            child: Text(
                              '5',
                              style: TextStyle(
                                color: AppColors.white,
                                fontFamily: 'Lato',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ── Collapsible headings — fade out while scrolling ──────────
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  // t = 0.0 when fully expanded, 1.0 when fully collapsed
                  final double expandedHeight =
                      kToolbarHeight + headingsHeight;
                  final double t = ((expandedHeight - constraints.maxHeight) /
                      headingsHeight)
                      .clamp(0.0, 1.0);

                  // Fade starts immediately, fully gone at t == 0.75
                  final double opacity = (1.0 - (t / 0.75)).clamp(0.0, 1.0);

                  return FlexibleSpaceBar(
                    collapseMode: CollapseMode.none,
                    background: Align(
                      alignment: Alignment.bottomLeft,
                      child: Opacity(
                        opacity: opacity,
                        child: Padding(
                          padding:
                          ResponsiveHelpers.screenPadding(context)
                              .copyWith(top: 0, bottom: h(8)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.heading1,
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: sp(24),
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.black,
                                ),
                              ),
                              Text(
                                AppStrings.heading2,
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: sp(24),
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.orange,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // SLIVER 2 — Sticky search bar
            SliverPersistentHeader(
              pinned: true,
              delegate: _SearchBarDelegate(
                height: searchBarHeight , // bar + top/bottom padding
                child: Container(
                  color: AppColors.white,
                  padding: ResponsiveHelpers.screenPadding(context)
                      .copyWith(top: h(8), bottom: h(8)),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              isDense: true,
                              prefixIcon:
                              const Icon(Icons.search_rounded),
                              hintText: AppStrings.search,
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: w(20)),
                        Card(
                          shape: const CircleBorder(),
                          color: AppColors.white,
                          child: Image.asset(AppImages.filter),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // SLIVER 3 — All scrollable content
            SliverPadding(
              padding: ResponsiveHelpers.screenPadding(context)
                  .copyWith(top: h(16), bottom: h(20)),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // ── Where to Visit
                  smallHeadings(AppStrings.visit, context),

                  SizedBox(height: h(16)),

                  SizedBox(
                    height: sp(100),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: AppStrings.cityName.length,
                      itemBuilder: (context, index) =>
                          cityView(AppStrings.cityName[index], context),
                    ),
                  ),

                  SizedBox(height: h(10)),

                  // ── Popular Destinations
                  Row(
                    children: [
                      smallHeadings(
                          AppStrings.popularDestination, context),
                      const Spacer(),
                      Text(
                        AppStrings.seeAll,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: AppColors.blue,
                          fontSize: sp(14),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: h(14)),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BookingScreen(name: 'The Nautilus \nMaldives'),
                              ),
                            );
                          },
                          child: popularDestinationCard(
                            AppImages.maldives,
                            AppStrings.cardTitle1,
                            AppStrings.address1,
                            4.6,
                            context,
                          ),
                        ),
                        SizedBox(width: w(12)),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BookingScreen(
                                    name: AppStrings.cardTitle2),
                              ),
                            );
                          },
                          child: popularDestinationCard(
                            AppImages.erinFalls,
                            AppStrings.cardTitle2,
                            AppStrings.address2,
                            3,
                            context,
                          ),
                        ),
                        SizedBox(width: w(12)),
                        popularDestinationCard(
                          AppImages.maldives,
                          AppStrings.cardTitle1,
                          AppStrings.address1,
                          4.6,
                          context,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: h(35)),

                  // ── Category section 1
                  _categorySection(context, sp),

                  SizedBox(height: h(35)),

                  // ── Category section 2
                  _categorySection(context, sp),

                  SizedBox(height: h(35)),

                  // ── Category section 3
                  _categorySection(context, sp),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to avoid repeating the category block three times
  Widget _categorySection(BuildContext context, double Function(double) sp) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            smallHeadings(AppStrings.category, context),
            const Spacer(),
            Text(
              AppStrings.seeAll,
              style: TextStyle(
                fontFamily: 'Lato',
                color: AppColors.blue,
                fontSize: sp(14),
              ),
            ),
          ],
        ),
        SizedBox(height: ResponsiveHelpers.h(context, 24)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            categoryView(AppImages.beach, AppStrings.beach),
            categoryView(AppImages.mountain, AppStrings.mountain),
          ],
        ),
      ],
    );
  }
}

// Sticky search-bar delegate
class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  const _SearchBarDelegate({required this.child, required this.height});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) =>
      child;

  @override
  bool shouldRebuild(_SearchBarDelegate old) =>
      old.height != height || old.child != child;
}

Widget popularDestinationCard(
    String img,
    String title,
    String location,
    double rating,
    BuildContext context,
    ) {
  return Container(
    height: ResponsiveHelpers.h(context, 200),
    width: ResponsiveHelpers.w(context, 200),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
    ),
    child: Stack(
      children: [
        // top-right arrow icon
        Positioned(
          top: 20,
          right: 14,
          child: SvgPicture.asset(AppImages.arrowIcon),
        ),

        // bottom text + rating
        Positioned(
          bottom: 10,
          left: 20,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
            child: Column(
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
                        index < rating.floor()
                            ? Icons.star
                            : Icons.star_border,
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
                        fontWeight: FontWeight.w600,
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
      border: Border.all(color: AppColors.primary),
      borderRadius: BorderRadius.circular(50),
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
              fontWeight: FontWeight.w600,
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
      fontWeight: FontWeight.w600,
      fontSize: ResponsiveHelpers.sp(context, 18),
    ),
  );
}

Widget cityView(Map<String, String> value, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: ResponsiveHelpers.sp(context, 65),
        width: ResponsiveHelpers.sp(context, 90),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(value['image']!),
            fit: BoxFit.fill,
          ),
          shape: BoxShape.circle,
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