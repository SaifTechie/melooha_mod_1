import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';
import '../utils/fonts.dart';
import '../utils/sizes.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double size;
  final Color color;
  final TextAlign? textAlign;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextDecoration? lineThrough;

  CustomText({
    Key? key,
    required this.title,
    this.color = AppColors.white,
    this.size = AppSizes.medium,
    this.textAlign = TextAlign.left,
    String? fontFamily,
    this.fontWeight = FontWeight.w500,
    this.lineThrough = TextDecoration.none,
  })  : this.fontFamily = fontFamily ?? AppFonts.primaryFont,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: fontFamily!,
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        decoration: lineThrough,
        decorationColor: AppColors.blue500,
      ),
    );
  }
}
