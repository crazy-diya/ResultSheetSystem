import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:result_sheet_system/core/utils/app_colors.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.width,
    required this.height,
    required this.title,
    required this.fontSize,
    required this.click,
  }) : super(key: key);

  final double width;
  final double height;
  final double fontSize;
  final String title;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: click,
      style: ElevatedButton.styleFrom(
        primary: AppColors.wPrimaryColor,
        onPrimary: AppColors.wSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        textStyle: GoogleFonts.playfairDisplay(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
        fixedSize: Size(width * 0.20, 45),
        minimumSize: const Size(250, 45),
      ),
      child: Text(
        title,
      ),
    );
  }
}
