

import 'package:flutter/material.dart';

import '../../constance/colors.dart';
import '../../constance/enums.dart';
import '../../constance/sizes.dart';
import 'brand_title.dart';


class HkBrandTitleWithVerifyIcon extends StatelessWidget {
  const HkBrandTitleWithVerifyIcon({super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = HkColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: HkBrandTitleText(
              title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign:  textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: HkSizes.xs,),
         Icon(Icons.verified, color: iconColor,size: HkSizes.iconXs,)
      ],
    );
  }
}
