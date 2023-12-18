import 'package:flutter/material.dart';
import 'package:melooha_mod_1/utils/colors.dart';
import '../utils/fonts.dart';
import '../utils/sizes.dart';
import 'custom_text.dart';
import 'custom_text_button.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController textEditingController;
  final int maxLine;
  // final bool? enabled;
  final String? headingText;
  final String hintText;
  final String? suffixText;
  final Color? borderColor;
  final VoidCallback? suffixTap;
  final Function(String)? onChanged;
  final VoidCallback? onTap;

  CustomTextField({
    super.key,
    required this.textEditingController,
    this.maxLine = 1,
    // this.enabled = true,
    this.headingText,
    required this.hintText,
    this.suffixText,
    this.borderColor,
    this.suffixTap,
    this.onChanged,
    this.onTap,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.headingText != null)
          CustomText(
            title: widget.headingText!,
            color: widget.borderColor != null
                ? widget.borderColor!
                : AppColors.blue500,
            size: AppSizes.extraMedium,
          ),
        if (widget.headingText != null)
          const SizedBox(
            height: AppSizes.paddingExtraSmall,
          ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.cornerRadiusSizeEight),
            border: widget.borderColor != null
                ? Border.all(color: widget.borderColor!)
                : null,
          ),
          child: TextFormField(
            maxLines: widget.maxLine,
            controller: widget.textEditingController,
            // enabled: widget.enabled,
            onTap: () {
              if (widget.onTap != null) {
                widget.onTap!();
              }
            },
            onChanged: (str){
              if (widget.onChanged != null) {
                widget.onChanged!(str);
              }
            },
            style: TextStyle(
              fontFamily: AppFonts.primaryFont,
              fontSize: AppSizes.medium,
              fontWeight: FontWeight.w500,
              color: AppColors.blue100,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: AppSizes.cornerRadiusSizeTwelve,
                horizontal: AppSizes.cornerRadiusSizeEight,
              ),
              suffix: (widget.suffixText != null)
                  ? CustomTextButton(
                      title: widget.suffixText!,
                      onTap: () {
                        print('inside onTap');
                        if (widget.suffixTap != null) {
                          print('inside if');
                          widget.suffixTap!();
                        }
                      },
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontFamily: AppFonts.primaryFont,
                fontSize: AppSizes.medium,
                fontWeight: FontWeight.w500,
                color: AppColors.blue200,
              ),
              labelStyle: TextStyle(
                fontFamily: AppFonts.primaryFont,
                fontSize: AppSizes.medium,
                fontWeight: FontWeight.w500,
                color: AppColors.blue200,
              ),
              filled: true,
              fillColor: AppColors.blue600,
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(AppSizes.cornerRadiusSizeEight),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
