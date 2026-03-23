import 'package:travel_safe/core/constants/app_images.dart';

class AppStrings {
  AppStrings._();

  // Splash Screen
  static const String appName = 'TravelSafe';

  // Onboarding Screen
  static const String skip = 'Skip';
  static const String book = 'Book';
  static const String findNew  = 'Find New';
  static const String locations  = 'Locations';
  static const String reservations = 'Reservations';
  static const String discoverAmazing = 'Discover\nAmazing';
  static const String destinations = 'Destinations';
  static const String onBoardingDesc1 ='We believe traveling around the world shouldn’t be hard.';
  static const String onBoardingDesc2 ='We are here to help you book tours with locals on-the-go and experience a wonderful trip.';
  static const String onBoardingDesc3 ='Worried about new places to visit and explore ? We’ve got you covered.';
  static const String btnLogin = 'Log in';
  static const String btnCreateAccount = 'Create Account';

  // Home Screen
  static const String userName = 'Hi, Spiderman';
  static const seeAll = 'See all';
  static const String search = 'Search';
  static const String beach = 'Beach';
  static const String mountain = 'Mountain';

  /// large headings
  static const String heading1 = 'Explore Amazing';
  static const String heading2 = 'Destinations !';

  ///small heading
  static const String visit = 'Where would you like to visit?';
  static const String popularDestination = 'Popular Destination';
  static const String category = 'Choose Category';

  /// lists
  static const List<Map<String, String>> cityName = [
    {'city': 'Abuja', 'image': AppImages.abuja},
    {'city': 'NewYork', 'image': AppImages.newYork},
    {'city': 'Sydney', 'image': AppImages.sydney},
    {'city': 'Toronto', 'image': AppImages.toronto},
    {'city': 'London', 'image': AppImages.london},
  ];

  /// card strings
  static const String cardTitle1 = 'The Nautilus Maldives';
  static const String cardTitle2 = 'Erin-Ijesha Falls';
  static const String address1 = 'The Nautilus Maldives, Baa Atoll';
  static const String address2 = 'Ekiti, Nigeria';

  /// rating
  static const String rating = '4.6';

  /// bottom navigation bar
  static const String home = 'Home';
  static const String chat = 'Chat';
  static const String schedule = 'Schedule';
  static const String saved = 'Saved';
  static const String profile = 'Profile';
  
  // Details Screen
  static const String maldivesDetails = 'The Nautilus is a privately-owned luxury resort in the Baa atoll UNESCO biosphere reserve, near Hanifaru Bay where you can swim with manta rays in season. This natural island has its own outstanding coral reef just metres from its beaches.';
  static const String bookNow = 'Book Now';
  static const String moreDetails = 'More Details';
  static const String duration = 'Duration';
  static const String ratingDetails = 'RATING';
  static const String overview = 'Overview';

}
