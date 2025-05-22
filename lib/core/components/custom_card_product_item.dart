import 'package:flutter/material.dart';
import 'package:fruits_dashboard/core/utils/app_colors.dart';
import 'package:fruits_dashboard/core/utils/app_styles.dart';
import 'package:fruits_dashboard/core/utils/assets_paths.dart';

class CustomCardProductItem extends StatelessWidget {
  const CustomCardProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: AppColors.appCardGeryBgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border_outlined, color: Colors.black),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    AssetsPaths.appStrawberryFruitPath,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 28),
                ListTile(
                  title: Text('بطيخ', style: TextStyles.bold16),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "100",
                          style: TextStyles.bold19.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(text: " "),
                        TextSpan(
                          text: 'جنية/كيلو',
                          style: TextStyles.semiBold16.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add, color: AppColors.whiteColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
