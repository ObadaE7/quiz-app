import 'package:flutter/material.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration inputDecoration({
  required String label,
  required String hintText,
  required IconData prefixIcon,
  Widget? suffixIcon,
}) =>
    InputDecoration(
      prefixIcon: Icon(prefixIcon, color: AppColors.mediumGray),
      suffixIcon: suffixIcon,
      label: Text(
        label,
        style: GoogleFonts.tajawal(
          color: AppColors.mediumGray,
        ),
      ),
      hintText: hintText,
      hintStyle: GoogleFonts.tajawal(
        color: AppColors.mediumGray,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
        borderSide: BorderSide(
          color: AppColors.mediumGray.withOpacity(0.5),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
        borderSide: BorderSide(
          color: AppColors.cyan,
          width: 2.0,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
        borderSide: BorderSide(
          color: AppColors.red,
          width: 2.0,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
        borderSide: BorderSide(
          color: AppColors.red,
          width: 2.0,
        ),
      ),
      errorStyle: GoogleFonts.tajawal(
        color: AppColors.red,
      ),
    );
