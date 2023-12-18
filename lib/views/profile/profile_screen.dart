import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:melooha_mod_1/universal_widgets/custom_text.dart';
import 'package:melooha_mod_1/utils/colors.dart';
import 'package:melooha_mod_1/views/profile/tabs/premium_screen.dart';
import 'package:redux/redux.dart';
import '../../data/models/purchase_plan_model.dart';
import '../../reducers/cart/actions.dart';
import '../../reducers/cart/reducer.dart';
import '../../universal_widgets/custom_icon_button.dart';
import '../../universal_widgets/custom_icon_with_title_btn.dart';
import '../../universal_widgets/expanded_btn_with_icon_and_title.dart';
import '../../universal_widgets/user_profile_image.dart';
import '../../utils/sizes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Store<AppState> store;
  final List<PurchasePlan> purchasePlans = [
    PurchasePlan(
      id: 1,
      title: 'Silver PLAN',
      isTrending: true,
      offerPer: 80,
      subTitle1: 'Get a chance to Ask any for',
      subTitle2: 'of your choice.',
      numOfQuestion: 5,
      offerPrice: 99,
      originalPrice: 495,
      planBannerAddress: 'assets/images/Silver plan.png',
    ),
    PurchasePlan(
      id: 2,
      title: 'GOLD PLAN',
      isTrending: false,
      offerPer: 85,
      subTitle1: 'Get a chance to Ask any for',
      subTitle2: 'of your choice.',
      numOfQuestion: 10,
      offerPrice: 149,
      originalPrice: 995,
      planBannerAddress: 'assets/images/Gold plan.png',
    ),
    PurchasePlan(
      id: 3,
      title: 'DIAMOND PLAN',
      isTrending: false,
      offerPer: 90,
      subTitle1: 'Get a chance to Ask any for',
      subTitle2: 'of your choice.',
      numOfQuestion: 30,
      offerPrice: 299,
      originalPrice: 2990,
      planBannerAddress: 'assets/images/Diamond Plan 1.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    store.dispatch(
      InitProductDataAction(purchasePlans),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingSmall),
            child: AppBar(
              elevation: 0,
              backgroundColor: AppColors.blue900,
              leading: UserProfileImage(),
              centerTitle: false,
              title: CustomText(title: 'Riya Singh'),
              actions: [
                CustomIconButton(
                  isBackground: false,
                  iconData: Icons.notifications_outlined,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingSmall),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(
                      height: AppSizes.paddingSmall,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        children: [
                          CustomIconWithTitleBtn(
                            imageLoc: 'assets/images/Group.png',
                            title: 'Aquarius',
                            onTap: () {},
                          ),
                          CustomIconWithTitleBtn(
                            imageLoc: 'assets/images/Group (1).png',
                            title: 'Sagittarius',
                            onTap: () {},
                          ),
                          CustomIconWithTitleBtn(
                            imageLoc: 'assets/images/arrow-up.png',
                            title: 'Capricorn',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: AppSizes.paddingLarge,
                    ),
                    SizedBox(
                      height: 120.0,
                      child: Row(
                        children: [
                          ExpandedBtnWithIconAndTitle(
                            imgLoc: 'assets/images/chat-smile-3-line.png',
                            title: '5 Questions',
                            subTitle: 'given',
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: AppSizes.paddingExtraSmall,
                          ),
                          ExpandedBtnWithIconAndTitle(
                            imgLoc: 'assets/images/file-paper-2-line.png',
                            title: '2 Reports',
                            subTitle: 'unlocked',
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: AppSizes.paddingExtraSmall,
                          ),
                          ExpandedBtnWithIconAndTitle(
                            imgLoc: 'assets/images/Feedback_icon.png',
                            title: '4 Feedbacks',
                            subTitle: 'given',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Column(
                children: [
                  const SizedBox(
                    height: AppSizes.paddingLarge,
                  ),
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppSizes.cornerRadiusSizeTwelve),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: AppSizes.paddingSmall),
                      decoration: BoxDecoration(
                        color: AppColors.blue700,
                        borderRadius: BorderRadius.circular(
                            AppSizes.cornerRadiusSizeTwelve),
                      ),
                      child: TabBar(
                        tabs: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: CustomText(
                              title: 'Family',
                              size: AppSizes.small,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: CustomText(
                              title: 'Premium',
                              size: AppSizes.small,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: CustomText(
                              title: 'Preferences',
                              size: AppSizes.small,
                            ),
                          ),
                        ],
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              AppSizes.cornerRadiusSizeTwelve),
                          color: AppColors.blue500,
                        ),
                        labelPadding: EdgeInsets.symmetric(
                          vertical: AppSizes.paddingMedium,
                        ),
                        dividerHeight: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSizes.paddingMedium,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Content of Tab 1
                        Container(
                          color: Colors.yellow,
                          child: Center(
                            child: Text('Tab 1 Content'),
                          ),
                        ),
                        // Content of Tab 2
                        PremiumScreen(),
                        Container(
                          color: Colors.red,
                          child: Center(
                            child: Text('Tab 2 Content'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
