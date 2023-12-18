import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:melooha_mod_1/universal_widgets/custom_icon_button.dart';
import 'package:melooha_mod_1/universal_widgets/custom_text.dart';
import 'package:melooha_mod_1/utils/enums.dart';
import 'package:melooha_mod_1/utils/sizes.dart';
import '../data/models/purchase_plan_model.dart';
import '../reducers/cart/actions.dart';
import '../reducers/cart/reducer.dart';
import '../reducers/cart/store.dart';
import '../universal_widgets/custom_text_field.dart';
import '../universal_widgets/expanded_button.dart';
import '../universal_widgets/hor_title_with_subtitle_widget.dart';
import '../universal_widgets/plan_offer_banner_widget.dart';
import '../utils/colors.dart';
import '../utils/fonts.dart';
import '../utils/message.dart';

class PlanSummeryScreen extends StatefulWidget {
  const PlanSummeryScreen({Key? key}) : super(key: key);

  @override
  State<PlanSummeryScreen> createState() => _PlanSummeryScreenState();
}

class _PlanSummeryScreenState extends State<PlanSummeryScreen> {
  final pcodeC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    pcodeC.dispose();
  }

  @override
  void initState() {
    super.initState();
    store.dispatch(UpdateBorderColorAction(null));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: AppSizes.paddingSmall,
            right: AppSizes.paddingSmall,
            bottom: AppSizes.paddingMedium,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: AppSizes.paddingMedium,
                    ),
                    // Custom App Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(title: 'Plan Summery'),
                        CustomIconButton(
                          iconData: Icons.close,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSizes.paddingExtraLarge,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          title: 'Selected Plan',
                          color: AppColors.blue500,
                          size: AppSizes.extraMedium,
                        ),
                        CustomText(
                          title: 'Change Plan',
                          color: AppColors.blue300,
                          size: AppSizes.extraMedium,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSizes.paddingSmall,
                    ),
                    StoreConnector<AppState, List<PurchasePlan>>(
                      converter: (store) => store.state.cart
                          .map(
                            (productId) => store.state.productData
                                .firstWhere((plan) => plan.id == productId),
                          )
                          .toList(),
                      builder: (context, cartList) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cartList.length,
                          itemBuilder: (context, index) {
                            final plan = cartList[index];

                            return PlanOfferBannerWidget(
                              plan: plan,
                              isSelected: true,
                              showPriceTag: false,
                              onTap: () {},
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: AppSizes.paddingExtraLarge,
                    ),
                    StoreConnector<AppState, Color?>(
                      converter: (store) => store.state.borderColor,
                      builder: (context, color) {
                        final suffixText =
                            color == AppColors.green ? '  X  ' : 'Apply';

                        return CustomTextField(
                          headingText: color == AppColors.green
                              ? 'Promo Code Applied'
                              : color == AppColors.red
                                  ? 'Invalid Promo Code'
                                  : 'Promo Code',
                          hintText: 'Enter Promo Code',
                          textEditingController: pcodeC,
                          suffixText: suffixText,
                          borderColor: color,
                          onChanged: (str){
                            if(pcodeC.text.isEmpty){
                              store.dispatch(UpdateBorderColorAction(null));
                            }
                          },
                          suffixTap: () {
                            if (suffixText == 'Apply') {
                              if (pcodeC.text.isNotEmpty &&
                                  pcodeC.text == "MELOOHA10") {
                                store.dispatch(
                                    UpdateBorderColorAction(AppColors.green));
                              } else {
                                store.dispatch(
                                    UpdateBorderColorAction(AppColors.red));
                              }
                            } else {
                              store.dispatch(UpdateBorderColorAction(null));
                            }
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: AppSizes.paddingExtraLarge,
                    ),
                    CustomText(
                      title: 'Summary',
                      color: AppColors.blue500,
                      size: AppSizes.extraMedium,
                    ),
                    Divider(
                      color: AppColors.blue700,
                    ),
                    const SizedBox(
                      height: AppSizes.paddingExtraLarge,
                    ),
                    HorTitleWithSubTitleWidget(
                      title: 'Total Amount',
                      subTitle: '${AppFonts.rupeeSymbol}2990',
                    ),
                    HorTitleWithSubTitleWidget(
                      title: 'Discount 90%',
                      titleColor: AppColors.pink300,
                      subTitle: '-${AppFonts.rupeeSymbol}2691',
                    ),
                    HorTitleWithSubTitleWidget(
                      title: 'Promocode 5%',
                      titleColor: AppColors.pink300,
                      subTitle: '-${AppFonts.rupeeSymbol}50',
                    ),
                    Divider(
                      color: AppColors.blue700,
                    ),
                    const SizedBox(
                      height: AppSizes.paddingMedium,
                    ),
                    HorTitleWithSubTitleWidget(
                      title: 'Total Cost',
                      subTitle: '${AppFonts.rupeeSymbol}249',
                      subtitleColor: AppColors.white,
                    ),
                  ],
                ),
              ),
              StoreConnector<AppState, Color?>(
                converter: (store) => store.state.borderColor,
                builder: (context, color) {
                  final suffixText =
                  color == AppColors.green ? '  X  ' : 'Apply';

                  return ExpandedButton(
                    title: 'Proceed To Pay',
                    onTap: () {
                      showMessageDialog(context, MessageType.success);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
