import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


extension WidgetExtensions on double {
  Widget get sbH => SizedBox(height: h,);

  Widget get sbW => SizedBox(width: w,);

}


extension MediaQuerySize on BuildContext {
  double getWidth() {
    return MediaQuery.of(this).size.width;
  }

  double getHeight() {
    return MediaQuery.of(this).size.height;
  }

}