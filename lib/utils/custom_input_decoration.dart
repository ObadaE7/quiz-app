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
      prefixIcon: Icon(prefixIcon, color: AppColors.gray),
      suffixIcon: suffixIcon,
      label: Text(
        label,
        style: GoogleFonts.tajawal(
          color: AppColors.gray,
        ),
      ),
      hintText: hintText,
      hintStyle: GoogleFonts.tajawal(
        color: AppColors.gray,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
        borderSide: BorderSide(
          color: AppColors.gray.withOpacity(0.5),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
        borderSide: BorderSide(
          color: AppColors.primary,
          width: 2.0,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
        borderSide: BorderSide(
          color: AppColors.danger,
          width: 2.0,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
        borderSide: BorderSide(
          color: AppColors.danger,
          width: 2.0,
        ),
      ),
      errorStyle: GoogleFonts.tajawal(
        color: AppColors.danger,
      ),
    );
