// ignore_for_file: use_build_context_synchronously
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:tech_task/utils/widget_extensions.dart';

import '../../theme/app_themes.dart';
import '../../utils/app_text.dart';
import '../../utils/constants.dart';

class AppAlert {
  static Future<void> show(
    BuildContext context, {
    required String message,
    String? title,
    bool success = false,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    Container(
      decoration: ShapeDecoration(
        color:
            success ? AppColors.successDialogColor : AppColors.errorDialogColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppFontSizes.fontSize8)),
      ),
      child: Container(
        height: AppFontSizes.fontSize72,
        padding: EdgeInsets.all(AppFontSizes.fontSize16),
        child: await Flushbar(
          maxWidth: context.getWidth() - 40,
          message: message,
          messageText: AppTextView.getAppTextView(message,
              textAlign: TextAlign.start,
              color: AppColors.black,
              weight: FontWeight.w600),
          borderRadius: BorderRadius.circular(AppFontSizes.fontSize10),
          icon: success
              ? Padding(
                  padding: EdgeInsets.only(
                      left: AppFontSizes.fontSize8,
                      right: AppFontSizes.fontSize8),
                  child: Image.asset(
                    AppImages.success,
                    width: AppFontSizes.fontSize40,
                    height: AppFontSizes.fontSize40,
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                      left: AppFontSizes.fontSize8,
                      right: AppFontSizes.fontSize8),
                  child: Image.asset(
                    AppImages.errorIcon,
                    width: AppFontSizes.fontSize40,
                    height: AppFontSizes.fontSize40,
                  ),
                ),
          backgroundColor: success
              ? AppColors.successDialogColor
              : AppColors.errorDialogColor,
          dismissDirection: FlushbarDismissDirection.HORIZONTAL,
          forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(seconds: success ? 3 : 6),
          margin: EdgeInsets.only(bottom: AppFontSizes.fontSize12),
        ).show(context),
      ),
    );
  }
}
