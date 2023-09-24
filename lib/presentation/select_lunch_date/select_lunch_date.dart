import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_task/utils/widget_extensions.dart';

import '../../routes/routes.dart';
import '../../theme/app_themes.dart';
import '../../utils/app_text.dart';
import '../../utils/constants.dart';
import '../components/custom_btn.dart';
import '../components/textField.dart';

class SelectLaunchDate extends StatefulWidget {
  const SelectLaunchDate({super.key});

  @override
  State<SelectLaunchDate> createState() => _SelectLaunchDateState();
}

class _SelectLaunchDateState extends State<SelectLaunchDate> {

  TextEditingController? selectDateController = TextEditingController();
  final DateTime _focusedDay = DateTime.now();

  final formattedDateTime =
  DateFormat("y-MM-dd").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24),
            child: ListView(
              children: [
                24.0.sbH,
                AppTextView.getAppTextViewBold(
                    "Welcome! 👋"),
                24.0.sbH,
                AppTextView.getAppTextView(
                    "You may select a preferred lunch date if not today.",
                  size: AppFontSizes.fontSize20
                ),
                100.0.sbH,
                EditTextForm(
                    hint: "Select lunch date",
                    onTap: () => _showCalendarDialog(context),
                    onChanged: (v) {},
                    readonly: true,
                    onFieldSubmitted: (v) {},
                    prefixIcon: Transform.scale(
                      scale: 0.4,
                      child: Image.asset(AppImages.selectDate),
                    ),
                    controller: selectDateController!),
                100.0.sbH,
                AppButton(
                  onPressed: () {
                    saveLunchDate();
                    navigationService.navigateTo(AppRoutes.ingredients);
                  },
                  title: "Proceed",
                  enabled: true,
                ),
                16.0.sbH,
              ],
            ),
          )),
    );
  }

  saveLunchDate() {
    selectDateController!.text.isEmpty ?
    sharedPreference.saveLaunchDate(formattedDateTime.toString())
    : null;
  }

  void _showCalendarDialog(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _focusedDay,
        firstDate: DateTime(2018),
        lastDate: DateTime(DateTime.now().year + 5),
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: AppColors.jade,
                  onPrimary: AppColors.white,
                  onSurface: AppColors.gray,
                  surfaceTint: AppColors.jade,
                ),
              ),
              child: child!);
        });
    if (pickedDate != null) {
      final formattedDateTime =
      DateFormat("y-MM-dd").format(pickedDate);
      setState(() {
        selectDateController?.text = formattedDateTime;
        sharedPreference.saveLaunchDate(formattedDateTime.toString());
      });
      debugPrint(
          "formattedDateTime::: $formattedDateTime");
    }
  }

}
