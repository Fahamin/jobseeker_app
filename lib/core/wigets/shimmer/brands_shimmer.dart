


import 'package:flutter/material.dart';
import 'package:jobseeker/core/wigets/shimmer/shimmer_effect.dart';

import '../layouts/grid_layout.dart';

class HkBrandsShimmer extends StatelessWidget {
  const HkBrandsShimmer({super.key,this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return HkGridLayout(
      mainAxisExtent: 80,
        itemCount: itemCount,
        itemBuilder: (context, index) => const HkShimmerEffect(width: 300, height: 80),
    );
  }
}
