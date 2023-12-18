import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CircularIcon extends StatelessWidget {
  final String imgLoc;

  const CircularIcon({
    super.key,
    required this.imgLoc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.blue600,
      ),
      child: Center(
        child: Image.asset(imgLoc),
      ),
    );
  }
}