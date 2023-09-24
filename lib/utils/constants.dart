import 'package:flutter/material.dart';
import '../data/cache/sharedpreferences.dart';
import '../routes/locator.dart';
import '../services/navigation_service.dart';

///Global variables
final NavigationService navigationService = getIt<NavigationService>();
final SharedPreference sharedPreference = SharedPreference();

class AppStrings {
  static String appName = 'Klasha Test App';
}

class Sized24Container extends StatelessWidget {
  final Widget? child;
  final Decoration? decoration;

  const Sized24Container({super.key, this.child, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: child,
    );
  }
}

class AppImages {
  static const String selectDate = "assets/images/ic_select_date.png";
  static const String success = "assets/images/ic_success.png";
  static const String errorIcon = "assets/images/ic_error.png";
  static const String backBtn = "assets/images/ic_left_arrow.svg";
}

class AppFontSizes {
  static double fontSize72 = 72.0;
  static double fontSize50 = 50.0;
  static double fontSize45 = 45.0;
  static double fontSize40 = 40.0;
  static double fontSize32 = 32.0;
  static double fontSize30 = 30.0;
  static double fontSize24 = 24.0;
  static double fontSize22 = 22.0;
  static double fontSize20 = 20.0;
  static double fontSize18 = 18.0;
  static double fontSize16 = 16.0;
  static double fontSize15 = 15.0;
  static double fontSize14 = 14.0;
  static double fontSize12 = 12.0;
  static double fontSize11 = 11.0;
  static double fontSize10 = 10.0;
  static double fontSize8 = 8.0;
  static double fontSize6 = 6.0;
  static double fontSize4 = 4.0;
  static double fontSize2 = 2.0;
}


