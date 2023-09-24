import 'package:flutter/material.dart';
import 'package:tech_task/utils/widget_extensions.dart';

import '../../theme/app_themes.dart';
import '../../utils/app_text.dart';
import '../../utils/constants.dart';

class IngredientItem extends StatelessWidget {
  final String? title;
  final String? useBy;
  final bool isSelected;
  final Function(bool) onItemSelect;

  const IngredientItem(
      {super.key,
      this.title,
      this.useBy,
      required this.isSelected,
      required this.onItemSelect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: AppFontSizes.fontSize8,
        horizontal: AppFontSizes.fontSize16,
      ),
      child: InkWell(
        onTap: () {
          onItemSelect(!isSelected);
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: AppFontSizes.fontSize8,
              horizontal: AppFontSizes.fontSize16),
          height: 60,
          //AppFontSizes.fontSize40,
          width: context.getWidth(),
          decoration: ShapeDecoration(
            color: isSelected ? AppColors.jade : Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 0.50,
                  color: isSelected
                      ? AppColors.jade
                      : AppColors.richTextColor),
              borderRadius: BorderRadius.circular(AppFontSizes.fontSize15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppTextView.getAppTextView("Title: ",
                      size: AppFontSizes.fontSize12,
                      color: isSelected ? AppColors.white : AppColors.gray),
                  AppTextView.getAppTextView(
                    title ?? "",
                    size: AppFontSizes.fontSize16,
                    color: isSelected ? AppColors.white : AppColors.black,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppTextView.getAppTextView("Use-By: ",
                      size: AppFontSizes.fontSize12,
                      color: isSelected ? AppColors.white : AppColors.gray),
                  AppTextView.getAppTextView(
                    useBy ?? "",
                    size: AppFontSizes.fontSize15,
                    color: isSelected ? AppColors.white : AppColors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
