import 'package:flutter/material.dart';

import '../../constance/enums.dart';


class HkBrandTitleText extends StatelessWidget {
  const HkBrandTitleText({
    super.key,
    this.color,
    this.maxLines = 1,
    required this.title,
    this.textAlign = TextAlign.start,
    this.brandTextSize = TextSizes.small
  });

  final Color? color;
  final String title;
  final int maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
      // Check which brandSize is required and set that style
      style: (brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium
          : brandTextSize == TextSizes.medium
          ? Theme.of(context).textTheme.bodyLarge
          : brandTextSize == TextSizes.large
          ? Theme.of(context).textTheme.titleLarge
          : Theme.of(context).textTheme.bodyMedium)!
          .copyWith(
        color: color,
        fontWeight: FontWeight.bold, // এই লাইনটি add করলেই bold হবে
      ),
    );

  }
}