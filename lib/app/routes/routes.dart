import 'package:get/get.dart';
import 'package:todoly/app/modules/authentication/binding/AuthenticationModuleBinding.dart';
import 'package:todoly/app/modules/authentication/views/loginScreen.dart';
import 'package:todoly/app/modules/introduction/binding/introductionModuleBinding.dart';
import 'package:todoly/app/modules/introduction/views/onBoardingScreen.dart';
import 'package:todoly/app/modules/introduction/views/splashScreen.dart';

class ROUTES {
  static get getSplashScreenRoute => "/introduction/splashscreen";
  static get getOnBoardingScreenRoute => "/introduction/onboardingscreen";
  static get getLoginScreenRoute => '/authentication/loginscreeb';

  static List<GetPage> routes = [
    GetPage(
      name: getSplashScreenRoute,
      page: () => SplashScreen(),
      binding: IntroductionModuleBinding(),
    ),
    GetPage(
      name: getOnBoardingScreenRoute,
      page: () => OnBoardingScreen(),
      binding: IntroductionModuleBinding(),
    ),
    GetPage(
      name: getLoginScreenRoute,
      page: () => LoginScreen(),
      binding: AuthenticationModuleBinding(),
    ),

  ];
}
