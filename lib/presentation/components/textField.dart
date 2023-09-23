import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_themes.dart';

class EditTextForm extends StatelessWidget {
  final String? Function(String?)? validator;
  final String hint;
  final bool readonly;
  final bool? disAbleEdit;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final Iterable<String>? autofillHints;
  final VoidCallback? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final Function(String) onChanged;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;

  const EditTextForm(
      {Key? key,
      this.readonly = false,
      required this.hint,
      required this.onChanged,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.onTap,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.inputFormatter,
      this.validator,
      this.autofillHints,
      this.suffixIcon,
      this.prefixIcon,
      this.disAbleEdit,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      width: size.width,
      child: TextFormField(
        textAlign: TextAlign.start,
        validator: validator,
        autofillHints: autofillHints,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        enableInteractiveSelection: false,
        maxLines: 1,
        style: GoogleFonts.archivo(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: disAbleEdit == true
                ? const Color(0xFFCCCCCC)
                : AppColors.black
        ),
        onChanged: onChanged,
        onTap: onTap,
        readOnly: readonly,
        autofocus: false,
        cursorColor: AppColors.black,
        textInputAction: TextInputAction.next,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: AppColors.inputFieldBackground,
          filled: true,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hint,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 19, vertical: 16),
          hintStyle: GoogleFonts.archivo(
              fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.richTextColor),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(color: AppColors.richTextColor)
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(color: AppColors.richTextColor,)
          ),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              borderSide: BorderSide(color: AppColors.richTextColor,)
          ),
        ),
        keyboardType: keyboardType,
        inputFormatters: inputFormatter,
      ),
    );
  }
}
