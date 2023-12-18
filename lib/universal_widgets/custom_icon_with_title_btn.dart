import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/sizes.dart';
import 'circular_icon.dart';
import 'custom_text.dart';

class CustomIconWithTitleBtn extends StatelessWidget {
  final String imageLoc;
  final String title;
  final VoidCallback onTap;

  const CustomIconWithTitleBtn({
    super.key,
    required this.imageLoc,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.cornerRadiusSizeEight),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingExtraSmall),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularIcon(
              imgLoc: imageLoc,
            ),
            const SizedBox(
              width: AppSizes.paddingExtraSmall,
            ),
            CustomText(
              title: title,
              size: AppSizes.small,
              color: AppColors.blue100,
            ),
          ],
        ),
      ),
    );
  }
}