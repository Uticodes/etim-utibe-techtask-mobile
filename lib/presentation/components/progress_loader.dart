import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../theme/app_themes.dart';

class ProgressLoader extends StatelessWidget {
  const ProgressLoader({this.allowBackButton = false, Key? key})
      : super(key: key);
  final bool allowBackButton;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(allowBackButton);
      },
      child: const Scaffold(
        backgroundColor: Colors.black26,
        body: Center(
          child: SpinKitCircle(
            color:AppColors.jade,
          ),
        ),
      ),
    );
  }
}
