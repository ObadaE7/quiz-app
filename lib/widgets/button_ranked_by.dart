import 'package:flutter/material.dart';
import 'package:quiz/utils/app_colors.dart';
import 'package:figma_squircle/figma_squircle.dart';

class ButtonRankedBy extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isButtonActive;

  const ButtonRankedBy({
    super.key,
    required this.text,
    required this.onPressed,
    this.isButtonActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          isButtonActive ? AppColors.cyan : Colors.transparent,
        ),
        foregroundColor: WidgetStatePropertyAll(
          isButtonActive ? AppColors.white : AppColors.mediumGray,
        ),
        shape: WidgetStatePropertyAll(
          SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius(
              cornerRadius: 13.0,
              cornerSmoothing: 1.0,
            ),
          ),
        ),
      ),
      child: Text(text),
    );
  }
}
