import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/sizes.dart';
import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomTextButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(AppSizes.cornerRadiusSizeSixteen),
      onTap: onTap,
      child: CustomText(
        title: title,
        size: AppSizes.extraMedium,
        color: AppColors.pink300,
      ),
    );
  }
}
