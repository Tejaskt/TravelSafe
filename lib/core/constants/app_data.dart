import 'package:travel_safe/core/constants/app_images.dart';
import 'package:travel_safe/core/constants/app_strings.dart';

class AppData {

  AppData._();

  static final List<Map<String ,String>> onboardingData = [
    {
      'img' : AppImages.onboardingImg1,
      'txt1' : AppStrings.discoverAmazing,
      'txt2' : AppStrings.destinations,
      'desc' : AppStrings.onBoardingDesc1,
    },
    {
      'img' : AppImages.onboardingImg2,
      'txt1' : AppStrings.book,
      'txt2' : AppStrings.reservations,
      'desc' : AppStrings.onBoardingDesc2,
    },
    {
      'img' : AppImages.onboardingImg3,
      'txt1' : AppStrings.findNew,
      'txt2' : AppStrings.locations,
      'desc' : AppStrings.onBoardingDesc3,
    }
  ];
}