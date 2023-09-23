import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_themes.dart';
import '../../utils/constants.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Path does not exist",
          style: GoogleFonts.poppins(
            fontSize: AppFontSizes.fontSize16,
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
