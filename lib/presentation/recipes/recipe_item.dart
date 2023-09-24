import 'package:flutter/material.dart';
import 'package:tech_task/utils/widget_extensions.dart';

import '../../theme/app_themes.dart';
import '../../utils/app_text.dart';
import '../../utils/constants.dart';

class RecipeItem extends StatelessWidget {
  final String? title;
  final String? ingredients;

  const RecipeItem({
    super.key,
    required this.title,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppFontSizes.fontSize8,
        horizontal: AppFontSizes.fontSize16,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppFontSizes.fontSize8,
            horizontal: AppFontSizes.fontSize16),
        width: context.getWidth(),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side:
                const BorderSide(width: 0.50, color: AppColors.richTextColor),
            borderRadius: BorderRadius.circular(AppFontSizes.fontSize15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextView.getAppTextView("Title: ",
                    size: AppFontSizes.fontSize12),
                AppTextView.getAppTextView(
                  title ?? "",
                  size: AppFontSizes.fontSize16,
                ),
              ],
            ),
            4.0.sbH,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextView.getAppTextView("Ingredients: ",
                    size: AppFontSizes.fontSize12),
                SizedBox(
                  width: context.getWidth() / 2 + 70,
                  child: AppTextView.getAppTextView(
                    ingredients ?? "",
                    size: AppFontSizes.fontSize15,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
