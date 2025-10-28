import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobseeker/core/constance/colors.dart';

import '../../../../core/wigets/custom_shapes/containers/circular_container.dart';
import '../../../../core/wigets/custom_shapes/containers/rounded_container.dart';
import '../controllers/home_controller.dart';

class JobpostHorizontal extends StatelessWidget {
 const JobpostHorizontal({super.key});



  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    Future.microtask(() => controller.getCategory());

    return Obx(() {
      return ListView.builder(
        itemCount: controller.categorylist.length,
        itemBuilder: (context, index) {
          var item = controller.categorylist[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: HkRoundedContainer(

              height: 100,
              width: 100,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 10),

              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(height: 3,),
                    Text(maxLines: 1,
                      item.jobPostsCount.toString(),
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
