import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/utils/app_colors.dart';
import 'package:fruits_dashboard/core/utils/app_styles.dart';

class BuildAgreementCheckbox extends StatelessWidget {
  final bool? value;
  final void Function(bool?)? onChanged;
  const BuildAgreementCheckbox({super.key, this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'is Featured Item ?',
          style: TextStyles.semiBold16.copyWith(color: AppColors.primaryColor),
        ),
        Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
