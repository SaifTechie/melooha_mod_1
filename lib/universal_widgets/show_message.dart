import 'package:flutter/material.dart';
import 'package:melooha_mod_1/universal_widgets/responsive_widget.dart';
import '../utils/colors.dart';
import '../utils/enums.dart';
import '../utils/sizes.dart';
import 'custom_text.dart';
import 'expanded_button.dart';


class ShowMessage extends StatelessWidget {
  const ShowMessage({
    super.key,
    required this.messageType,
  });

  final MessageType messageType;

  @override
  Widget build(BuildContext context) {
    final success = MessageType.success;
    final failure = MessageType.failure;
    final warning = MessageType.warning;
    return Center(
      child: ResponsiveWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  messageType == success
                      ? 'assets/images/Group 729740.png'
                      : 'assets/images/Group 729740 (1).png',
                  width: 150.0,
                  height: 150.0,
                ),
                const SizedBox(
                  height: AppSizes.paddingSmall,
                ),
                CustomText(
                  title: messageType == success
                      ? 'Payment Successfull'
                      : 'Payment Failed!',
                  color: AppColors.blue500,
                  size: AppSizes.extraMedium,
                ),
                const SizedBox(
                  height: AppSizes.paddingExtraSmall,
                ),
                CustomText(
                  title: messageType == success
                      ? 'Thank you for purchasing Report - Diamond Plan.'
                      : 'Oops, looks like your recent payment was unsuccessful.',
                  textAlign: TextAlign.center,
                ),
                // const SizedBox(
                //   height: AppSizes.paddingExtraExtraLarge * 2,
                // ),
              ],
            ),
            messageType == success
                ? Column(
              children: [
                CustomText(
                  title: '3 Premium Reports',
                  color: AppColors.blue300,
                  size: AppSizes.extraMedium,
                ),
                CustomText(
                  title: 'added to your account',
                  color: AppColors.blue500,
                  size: AppSizes.extraMedium,
                ),
                const SizedBox(
                  height: AppSizes.paddingExtraExtraLarge * 3,
                ),
              ],
            )
                : SizedBox(),
            ExpandedButton(
              title: messageType == success ? 'Countinue' : 'Try Again',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: AppSizes.paddingExtraLarge,
            ),
          ],
        ),
      ),
    );
  }
}
