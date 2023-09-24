import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_task/utils/widget_extensions.dart';

import '../../theme/app_themes.dart';
import '../../utils/app_text.dart';
import '../../utils/constants.dart';

class CustomAppBar extends AppBar {
  final String headerTitle;
  final BuildContext context;
  final Function() onTap;

  @override
  CustomAppBar(this.context,
      {super.key, required this.headerTitle, required this.onTap})
      : super(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: InkWell(
                onTap: onTap, child: SvgPicture.asset(
                AppImages.backBtn,
              color: AppColors.gray,
            )),
          ),
          leadingWidth: 40,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextView.getAppTextViewBold(headerTitle, size: 19),
                25.0.sbW
              ],
            ),
          ),
          elevation: 0.0,
          toolbarHeight: 40,
          automaticallyImplyLeading: false,
        );
}

