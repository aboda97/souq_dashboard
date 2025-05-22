import 'package:flutter/material.dart';
import 'package:fruits_dashboard/constants.dart';
import 'package:fruits_dashboard/core/utils/app_colors.dart';
import 'package:fruits_dashboard/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.bold16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

class CustomBtnApp extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double? elevation;
  final IconData? icon;
  final bool isLoading;
  const CustomBtnApp({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    required this.textColor,
    required this.borderRadius,
    required this.elevation,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: kVerticalPaddding),
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        foregroundColor: textColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: isLoading ? null : onPressed,
      child:
          isLoading
              ? CircularProgressIndicator(color: AppColors.whiteColor)
              : Text(text, style: TextStyles.bold19),
    );
  }
}
