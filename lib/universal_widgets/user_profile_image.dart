import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/sizes.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.cornerRadiusSizeForty),
        border: Border.all(
          width: 2.0,
          color: AppColors.pink600,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.cornerRadiusSizeForty),
        child: Image.network(
          'https://th.bing.com/th/id/OIP.2i5UaEHaQM3PYAYXQyM1AAAAAA?rs=1&pid=ImgDetMain',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}