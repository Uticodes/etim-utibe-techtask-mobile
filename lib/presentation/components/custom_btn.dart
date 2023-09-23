import 'package:flutter/cupertino.dart';
import '../../theme/app_themes.dart';
import '../../utils/app_text.dart';
import '../../utils/constants.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final bool enabled;
  final Color? color;

  const AppButton({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.enabled,
     this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: enabled ? onPressed : null,
        child: Container(
          height: 64,
          padding: EdgeInsets.symmetric(
              vertical: 2.5,
              horizontal: AppFontSizes.fontSize16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppFontSizes.fontSize15),
              color: enabled
                  ? color ?? AppColors.lightAccent
                  : const Color(0xFFF2F2F2),),
          child: Center(
              child: AppTextView.getAppTextViewCF(title,
                  size: AppFontSizes.fontSize16,
                  color: enabled ? AppColors.white : const Color(0xFFCCCCCC),
                  weight: FontWeight.w700,
                  height: 1.5,
                  letterSpacing: 0.3)),
        ));
  }
}

