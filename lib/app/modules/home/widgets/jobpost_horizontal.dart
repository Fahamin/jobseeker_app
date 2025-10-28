import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobseeker/core/constance/colors.dart';
import 'package:jobseeker/core/wigets/images/rounded_image.dart';

import '../../../../core/constance/environment.dart';
import '../../../../core/wigets/custom_shapes/containers/circular_container.dart';
import '../../../../core/wigets/custom_shapes/containers/rounded_container.dart';
import '../controllers/home_controller.dart';

class JobpostHorizontal extends StatelessWidget {
  const JobpostHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeController>();
    Future.microtask(() => controller.getJobsList());

    return Obx(() {
      return ListView.builder(
        itemCount: controller.joblist.length,
        itemBuilder: (context, index) {
          var item = controller.joblist[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: HkRoundedContainer(
              height: 100,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 10),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HkRoundedImage(
                      imageUrl: "${Environment.baseUrl}storage/${item.image}",
                      isNetworkImage: true,
                      height: 80,
                      width: 80,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 3),
                          Text(
                            maxLines: 1,
                            item.title.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            maxLines: 1,
                            item.location.toString(),
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          Text(
                            maxLines: 1,
                            " Deadline: ${item.dateline}",

                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Text(
                      maxLines: 1,
                      item.salary.toString(),
                      style: TextStyle(fontWeight: FontWeight.normal),
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
