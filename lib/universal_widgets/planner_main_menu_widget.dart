import 'package:flutter/material.dart';

import '../data/models/planner_main_menu_model.dart';
import '../utils/colors.dart';
import '../utils/fonts.dart';
import '../utils/sizes.dart';
import 'custom_text.dart';
import 'expanded_button.dart';

class PlannerMainMenuWidget extends StatelessWidget {
  final PlannerMainMenu menu;
  final VoidCallback onTap;

  const PlannerMainMenuWidget({
    Key? key,
    required this.menu,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppSizes.paddingSmall),
      padding: EdgeInsets.all(AppSizes.paddingLarge),
      decoration: BoxDecoration(
        color: AppColors.blue600,
        borderRadius: BorderRadius.circular(AppSizes.cornerRadiusSizeEight),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Center(
              child: Image.asset(
                menu.planBannerAddress,
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: menu.subHeading,
                  color: AppColors.blue300,
                  size: AppSizes.small,
                ),
                CustomText(
                  title: menu.title,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.secondaryFont,
                ),
                const SizedBox(
                  height: AppSizes.paddingSmall,
                ),
                CustomText(
                  title: menu.subTitle,
                  color: AppColors.blue300,
                  size: AppSizes.small,
                ),
                const SizedBox(
                  height: AppSizes.paddingLarge,
                ),
                ExpandedButton(
                  title: menu.btnString,
                  onTap: onTap,
                ),
                CustomText(
                  title:
                  'Starts from ${AppFonts.rupeeSymbol}${menu.startingPrice}*',
                  color: AppColors.blue300,
                  size: AppSizes.small,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}