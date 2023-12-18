import 'package:flutter/material.dart';

import '../utils/sizes.dart';

class BorderedContainer extends StatelessWidget {
  final Color borderColor;
  final Widget child;

  const BorderedContainer({
    super.key,
    required this.borderColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.paddingMedium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.cornerRadiusSizeEight),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: child,
    );
  }
}