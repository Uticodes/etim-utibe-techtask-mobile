import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_themes.dart';
import 'constants.dart';

class AppTextView {
  static Widget getAppTextView(text,
      {size,
      color,
      textAlign,
      weight,
      height,
      letterSpacing,
      overflow,
       int? maxLines,
        softWrap,
      TextDecoration? textDecoration}) {
    final displayText = text.toString().toLowerCase() == "null" ? "" : text;
    final textSize = size == null ? null : double.parse(size.toString());
    return Text(displayText,
        textAlign: textAlign ?? TextAlign.center,
        overflow: overflow,
        softWrap: softWrap,
        maxLines: maxLines,
        style: GoogleFonts.archivo(
            color: color ?? AppColors.gray,
            fontSize: textSize ?? AppFontSizes.fontSize14,
            fontWeight: weight ?? FontWeight.w400,
            fontStyle: FontStyle.normal,
            decoration: textDecoration ?? TextDecoration.none,
            height: height ?? 1.4,
            letterSpacing: letterSpacing ?? 0.3));
  }

  static Widget getAppTextViewCF(text,
      {size,
        color,
        textAlign,
        weight,
        height,
        letterSpacing,
        TextDecoration? textDecoration}) {
    final displayText = text.toString().toLowerCase() == "null" ? "" : text;
    final textSize = size == null ? null : double.parse(size.toString());
    return Text(displayText,
        textAlign: textAlign ?? TextAlign.center,
        style: GoogleFonts.archivo(
            color: color ?? AppColors.gray,
            fontSize: textSize ?? AppFontSizes.fontSize14,
            fontWeight: weight ?? FontWeight.w400,
            fontStyle: FontStyle.normal,
            decoration: textDecoration ?? TextDecoration.none,
            height: height ?? 1.4,
            letterSpacing: letterSpacing ?? 0.3
        )
    );
  }

  static Widget getAppTextViewBold(text,
      {size,
      color,
      textAlign,
      weight,
      height,
      overflow,
      letterSpacing,
      TextDecoration? textDecoration}) {
    final textSize = size == null ? null : double.parse(size.toString());
    return Text(text,
        textAlign: textAlign ?? TextAlign.center,
        overflow: overflow,
        style: GoogleFonts.archivo(
            color: color ?? AppColors.black,
            fontSize: textSize ?? AppFontSizes.fontSize24,
            fontWeight: weight ?? FontWeight.w700,
            fontStyle: FontStyle.normal,
            decoration: textDecoration ?? TextDecoration.none,
            height: height ?? 1.3,
            letterSpacing: letterSpacing ?? -0.2
        )
    );
  }
}
