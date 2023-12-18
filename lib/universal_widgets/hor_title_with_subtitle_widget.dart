import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/sizes.dart';
import 'custom_text.dart';

class HorTitleWithSubTitleWidget extends StatelessWidget {
  final String title;
  final String subTitle;

  final Color titleColor;
  final Color subtitleColor;

  const HorTitleWithSubTitleWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.titleColor = AppColors.white,
    this.subtitleColor = AppColors.blue500,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSizes.paddingSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            title: title,
            size: AppSizes.extraMedium,
            color: titleColor,
          ),
          CustomText(
            title: subTitle,
            color: subtitleColor,
          ),
        ],
      ),
    );
  }
}