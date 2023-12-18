import 'package:flutter/material.dart';

import '../data/models/purchase_plan_model.dart';
import '../utils/colors.dart';
import '../utils/fonts.dart';
import '../utils/sizes.dart';
import 'bordered_container.dart';
import 'custom_text.dart';

class PlanOfferBannerWidget extends StatelessWidget {
  final PurchasePlan plan;
  final bool isSelected;
  final bool showPriceTag;
  final VoidCallback onTap;

  const PlanOfferBannerWidget({
    super.key,
    required this.plan,
    this.isSelected = false,
    this.showPriceTag = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isSelected)
          Positioned(
            top: 20,
            right: 10,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: AppColors.pink600,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                size: 16,
              ),
            ),
          ),
        if (plan.isTrending)
          Positioned(
            bottom: 10,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.paddingSmall,
                vertical: AppSizes.paddingSmall / 2,
              ),
              decoration: BoxDecoration(
                color: AppColors.blue500,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.cornerRadiusSizeEight),
                  bottomLeft: Radius.circular(AppSizes.cornerRadiusSizeEight),
                ),
              ),
              child: CustomText(
                title: 'Trending',
                size: AppSizes.small,
              ),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(top: AppSizes.paddingSmall),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(AppSizes.cornerRadiusSizeEight),
            child: BorderedContainer(
              borderColor: isSelected ? AppColors.pink600 : AppColors.blue500,
              child: Row(
                children: [
                  Flexible(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              title: '${plan.title} - '.toUpperCase(),
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFonts.secondaryFont,
                            ),
                            CustomText(
                              title: '${plan.offerPer}% OFF',
                              color: AppColors.pink400,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFonts.secondaryFont,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSizes.paddingSmall,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: 'Get a chance to Ask any for',
                              color: AppColors.blue300,
                              size: AppSizes.small,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  title: '${plan.numOfQuestion} Questions, ',
                                  size: AppSizes.small,
                                ),
                                CustomText(
                                  title: 'of your choice.',
                                  color: AppColors.blue300,
                                  size: AppSizes.small,
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (showPriceTag)
                          const SizedBox(
                            height: AppSizes.paddingLarge,
                          ),
                        if (showPriceTag)
                          Row(
                            children: [
                              CustomText(
                                title:
                                '${AppFonts.rupeeSymbol}${plan.offerPrice} Only ',
                                size: AppSizes.extraMedium,
                                fontWeight: FontWeight.w700,
                              ),
                              CustomText(
                                title:
                                '${AppFonts.rupeeSymbol}${plan.originalPrice}',
                                color: AppColors.blue300,
                                size: AppSizes.extraSmall,
                                lineThrough: TextDecoration.lineThrough,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Image.asset(
                      plan.planBannerAddress,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}