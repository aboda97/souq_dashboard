import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/components/custom_btn.dart';
import 'package:fruits_dashboard/core/helper/excution_navigator.dart';
import 'package:fruits_dashboard/core/utils/app_colors.dart';
import 'package:fruits_dashboard/features/add_product_feature/presentation/views/add_product_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CustomBtnApp(
            text: 'Add Product',
            onPressed: () {
              executionPushReplacmentNamedNavigator(
                context,
                AddProductView.routeName,
                0,
              );
            },
            textColor: AppColors.whiteColor,
            backgroundColor: AppColors.primaryColor,
            borderRadius: 16,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
