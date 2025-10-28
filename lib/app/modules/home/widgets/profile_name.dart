import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobseeker/app/modules/home/controllers/home_controller.dart';
import 'package:jobseeker/app/modules/login/controllers/login_controller.dart';
import 'package:jobseeker/core/constance/sizes.dart';
import 'package:jobseeker/core/wigets/appbar/appbar.dart';
import 'package:jobseeker/core/wigets/texts/brand_title.dart';

import '../../../../core/constance/enums.dart';
import '../../../../core/wigets/shimmer/shimmer_effect.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child:  Obx(() {
        return HkBrandTitleText(
          title: controller.user.value.name.toString(),
          textAlign: TextAlign.start,
          brandTextSize: TextSizes.large,
        );
      }),
    );
  }
}
