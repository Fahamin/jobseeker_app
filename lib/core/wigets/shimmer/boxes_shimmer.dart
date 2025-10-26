

import 'package:flutter/material.dart';
import 'package:jobseeker/core/wigets/shimmer/shimmer_effect.dart';

import '../../constance/sizes.dart';

class HkBoxesShimmer extends StatelessWidget {
  const HkBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            /// Three Products
            Expanded(child: HkShimmerEffect(width: 150, height: 110)),
            SizedBox(width: HkSizes.spaceBtwItems,),
            Expanded(child: HkShimmerEffect(width: 150, height: 110)),
            SizedBox(width: HkSizes.spaceBtwItems,),
            Expanded(child: HkShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
