import 'package:travel_safe/core/constants/app_images.dart';
import 'package:travel_safe/core/constants/app_strings.dart';

class AppData {

  AppData._();

  static final List<Map<String ,String>> onboardingData = [
    {
      'img1' : AppImages.img1,
      'img2' : AppImages.img2,
      'img3' : AppImages.img3,
      'txt1' : AppStrings.discoverAmazing,
      'txt2' : AppStrings.destinations,
      'desc' : AppStrings.onBoardingDesc1,
    },
    {
      'img1' : AppImages.ob2i1,
      'img2' : AppImages.ob2i2,
      'img3' : AppImages.ob2i3,
      'txt1' : AppStrings.book,
      'txt2' : AppStrings.reservations,
      'desc' : AppStrings.onBoardingDesc2,
    },
    {
      'img1' : AppImages.ob3i1,
      'img2' : AppImages.ob3i2,
      'img3' : AppImages.ob3i3,
      'txt1' : AppStrings.findNew,
      'txt2' : AppStrings.locations,
      'desc' : AppStrings.onBoardingDesc3,
    }
  ];
}