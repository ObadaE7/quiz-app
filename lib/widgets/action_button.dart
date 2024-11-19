import 'package:flutter/material.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:figma_squircle/figma_squircle.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final bool isHasIcon;
  final IconData? icon;
  final bool isFilled;
  final VoidCallback? onPressed;

  const ActionButton({
    super.key,
    required this.label,
    this.isHasIcon = false,
    this.icon,
    required this.isFilled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: isFilled
            ? const WidgetStatePropertyAll(AppColors.cyan)
            : const WidgetStatePropertyAll(Colors.transparent),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 16.0),
        ),
        shape: WidgetStatePropertyAll(
          SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 25.0,
              cornerSmoothing: 1.0,
            ),
          ),
        ),
        side: !isFilled
            ? const WidgetStatePropertyAll(
                BorderSide(
                  color: AppColors.cyan,
                  width: 2.0,
                ),
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isHasIcon) Icon(icon, color: AppColors.white),
          SizedBox(width: isHasIcon ? 8.0 : 0.0),
          Text(
            label,
            style: GoogleFonts.tajawal(
              textStyle: TextStyle(
                color: isFilled ? AppColors.white : AppColors.cyan,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
