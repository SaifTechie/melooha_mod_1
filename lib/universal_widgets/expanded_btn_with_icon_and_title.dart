import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/sizes.dart';
import 'custom_text.dart';

class ExpandedBtnWithIconAndTitle extends StatelessWidget {
  final String imgLoc;
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const ExpandedBtnWithIconAndTitle({
    super.key,
    required this.imgLoc,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSizes.cornerRadiusSizeFour),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.paddingSmall,
            vertical: AppSizes.paddingExtraSmall,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.blue700),
            borderRadius: BorderRadius.circular(
              AppSizes.cornerRadiusSizeFour,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                imgLoc,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    title: title,
                    color: AppColors.white,
                    size: AppSizes.small,
                  ),
                  CustomText(
                    title: subTitle,
                    color: AppColors.blue500,
                    size: AppSizes.extraSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}