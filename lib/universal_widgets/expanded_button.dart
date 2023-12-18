import 'package:flutter/material.dart';
import 'package:melooha_mod_1/utils/colors.dart';
import 'package:melooha_mod_1/utils/sizes.dart';
import 'custom_text.dart';

class ExpandedButton extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final IconData? iconData;
  final VoidCallback onTap;

  const ExpandedButton({
    super.key,
    this.backgroundColor = AppColors.pink600,
    required this.title,
    this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.cornerRadiusSizeEight),
      child: Container(
        padding: EdgeInsets.all(AppSizes.cornerRadiusSizeEight),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppSizes.cornerRadiusSizeEight),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconData != null)
              Icon(
                iconData,
                color: AppColors.blue600,
              ),
            if (iconData != null)
              SizedBox(
                width: 3,
              ),
            CustomText(
              title: title,
              textAlign: TextAlign.center,
              size: AppSizes.extraMedium,
            ),
          ],
        ),
      ),
    );
  }
}
