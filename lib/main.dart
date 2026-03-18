import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_safe/core/constants/app_colors.dart';
import 'package:travel_safe/core/constants/app_strings.dart';
import 'package:travel_safe/views/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: .fromSeed(
              seedColor: AppColors.primary,
              primary: AppColors.primary,
            ),
          ),
          home: Splashscreen(),
        );
      },
    );
  }
}
