import 'package:flutter/material.dart';
import 'package:travel_safe/core/constants/app_colors.dart';
import 'package:travel_safe/core/constants/app_images.dart';
import 'package:travel_safe/core/constants/app_strings.dart';
import 'package:travel_safe/views/screen/onboarding_screen.dart';
import 'package:travel_safe/views/screen/onboarding.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    super.initState();
    checkLogin();
  }
  
  void checkLogin() async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) => Onboarding()
        )
    );
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
      children : [

        Image.asset(
          AppImages.background,
          width: .infinity,
          height: .infinity,
          fit: BoxFit.cover,
        ),

        Container(
          color: AppColors.blue.withValues(alpha: 0.65),
        ),

        Center(
          child: Row(
            mainAxisAlignment: .center,
            children: [

              Text(
                AppStrings.appName,
                style: TextStyle(
                  fontFamily: "JosefinSans",
                  fontSize: 40,
                  color: AppColors.white,
                  shadows:[
                    Shadow(
                      blurRadius: 4,
                      color: AppColors.black.withValues(alpha: 0.25),
                      offset: Offset(0, 4)
                    )
                  ]
                ),
              ),

              Image.asset(AppImages.location),
            ],
          ),
        )
      ])
    );
  }
}
