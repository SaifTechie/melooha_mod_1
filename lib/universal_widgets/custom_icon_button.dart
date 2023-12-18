import 'package:flutter/material.dart';
import 'package:melooha_mod_1/utils/colors.dart';
import 'package:melooha_mod_1/utils/sizes.dart';

class CustomIconButton extends StatelessWidget {
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  final IconData iconData;
  final bool isBackground;
  final VoidCallback onTap;

  CustomIconButton({
    super.key,
    this.topLeft = AppSizes.cornerRadiusSizeEight,
    this.topRight = AppSizes.cornerRadiusSizeEight,
    this.bottomLeft = AppSizes.cornerRadiusSizeEight,
    this.bottomRight = AppSizes.cornerRadiusSizeEight,
    required this.iconData,
    this.isBackground = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(topLeft),
      child: Container(
        padding: EdgeInsets.all(AppSizes.cornerRadiusSizeEight),
        decoration: BoxDecoration(
          color: isBackground ? AppColors.blue600 : null,
          border: !isBackground ? Border.all(color: AppColors.blue600) : null,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            topRight: Radius.circular(topRight),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
          ),
        ),
        child: Icon(
          iconData,
          color: AppColors.white,
        ),
      ),
    );
  }
}
