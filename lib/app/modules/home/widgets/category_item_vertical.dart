import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobseeker/core/constance/colors.dart';

import '../../../../core/wigets/custom_shapes/containers/circular_container.dart';
import '../../../../core/wigets/custom_shapes/containers/rounded_container.dart';
import '../../../../core/wigets/shimmer/shimmer_effect.dart';
import '../controllers/home_controller.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});


  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    Future.microtask(() => controller.getCategory());

    return Obx(() {


      return ListView.builder(
        itemCount: controller.categorylist.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (controller.isLoading.value) {
            // Loading: shimmer দেখাবে
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: const HkShimmerEffect(width: 100, height: 100, ),
            );
          }
          var item = controller.categorylist[index];
          return HkRoundedContainer(

            height: 100,
            width: 100,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),

            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HkCircularContainer(
                    width: 40,
                    height: 40,
                    backgroundColor: HkColors.bgDarkContainer,
                    child: Icon(
                      controller.getRandomIcon(),
                      size: 20,
                      color: Colors.purple,
                    ),
                  ),
                  SizedBox(height: 3,),
                  Text(maxLines: 1,
                    item.name.toString(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall,
                  ),
                  SizedBox(height: 3,),
                  Text(maxLines: 1,
                    "${item.jobPostsCount} Jobs",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall,
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
