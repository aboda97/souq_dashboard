import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/utils/app_colors.dart';
import 'package:fruits_dashboard/core/utils/app_styles.dart';

class CustomTxtSpan extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final VoidCallback onRegisterTap;
  const CustomTxtSpan({
    super.key,
    required this.onRegisterTap,
    required this.textOne,
    required this.textTwo,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: textOne,
        style: TextStyles.semiBold16.copyWith(color: Colors.grey),
        children: [
          TextSpan(
            text: textTwo,
            style: TextStyles.bold16.copyWith(color: AppColors.primaryColor),
            recognizer: TapGestureRecognizer()..onTap = onRegisterTap,
          ),
        ],
      ),
    );
  }
}
