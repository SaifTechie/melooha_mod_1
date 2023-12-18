import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:melooha_mod_1/universal_widgets/custom_text.dart';
import 'package:melooha_mod_1/universal_widgets/expanded_button.dart';
import 'package:melooha_mod_1/views/plan_summery_screen.dart';
import '../../../data/models/planner_main_menu_model.dart';
import '../../../data/models/purchase_plan_model.dart';
import '../../../reducers/cart/actions.dart';
import '../../../reducers/cart/reducer.dart';
import '../../../reducers/cart/store.dart';
import '../../../universal_widgets/plan_offer_banner_widget.dart';
import '../../../universal_widgets/planner_main_menu_widget.dart';
import '../../../utils/colors.dart';
import '../../../utils/sizes.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  final List<PlannerMainMenu> plannerMenuItem = [
    PlannerMainMenu(
      subHeading: 'Explore Packages',
      title: 'Questions',
      subTitle: 'Ask premium question in budget friendly rate.',
      btnString: 'Explore Question Packs',
      startingPrice: 99,
      planBannerAddress: 'assets/images/Number of questions.png',
    ),
    PlannerMainMenu(
      subHeading: 'Explore Packages',
      title: 'Reports',
      subTitle: 'Get your personality reports at a pocket friendly rates.',
      btnString: 'Explore Reports Packs',
      startingPrice: 149,
      planBannerAddress: 'assets/images/Reports.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingSmall),
      physics: NeverScrollableScrollPhysics(),
      itemCount: plannerMenuItem.length,
      itemBuilder: (context, index) {
        return PlannerMainMenuWidget(
          menu: plannerMenuItem[index],
          onTap: () {
            _showBottomSheet(context);
          },
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.75,
          maxChildSize: 1.0,
          minChildSize: 0.5,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.blue600,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    AppSizes.cornerRadiusSizeTwelve,
                  ),
                  topRight: Radius.circular(
                    AppSizes.cornerRadiusSizeTwelve,
                  ),
                ),
              ),
              padding:
              EdgeInsets.symmetric(horizontal: AppSizes.paddingSmall),
              child: Column(
                children: [
                  const SizedBox(
                    height: AppSizes.paddingExtraLarge,
                  ),
                  CustomText(
                    title: 'Select a Plan',
                    textAlign: TextAlign.center,
                    size: AppSizes.small,
                    color: AppColors.blue300,
                  ),
                  CustomText(
                    title: 'Get Personalized Answers',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: AppSizes.paddingLarge,
                  ),
                  StoreConnector<AppState, List<PurchasePlan>>(
                    converter: (store) => store.state.productData,
                    builder: (context, productList) {
                      return Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: productList.length,
                          itemBuilder: (context, index) {
                            final plan = productList[index];
                            final isSelected =
                            store.state.cart.contains(plan.id);

                            return PlanOfferBannerWidget(
                              plan: plan,
                              isSelected: isSelected,
                              onTap: () {
                                if (isSelected) {
                                  // If already selected, remove from cart (deselect)
                                  store.dispatch(
                                    RemoveFromCartAction(plan.id),
                                  );
                                } else {
                                  // If not selected, add to cart (select)
                                  store.dispatch(
                                    AddToCartAction(plan.id),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: AppSizes.paddingExtraLarge,
                  ),
                  ExpandedButton(
                    title: 'Buy Plan',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlanSummeryScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: AppSizes.paddingMedium,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _testSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.75,
          maxChildSize: 1.0,
          minChildSize: 0.5,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.white,
              child: ListView.builder(
                controller: scrollController,
                itemCount: 50,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
