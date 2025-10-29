import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseeker/app/model/category_model.dart';
import '../../../../core/wigets/custom_shapes/containers/circular_container.dart';
import '../../../../core/wigets/shimmer/shimmer_effect.dart';
import '../../home/controllers/home_controller.dart';

class TextHorizontalList extends StatelessWidget {
  final int selectedIndex;
  final Data data;

  const TextHorizontalList({super.key, required this.selectedIndex,required this.data});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Obx(() => HkCircularContainer(
      height: 50,
      width: 100,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10),
      backgroundColor:  homeController.selectedCategoryIndex.value == selectedIndex  ? Colors.blue : Colors.grey.shade200,
      child: Center(
        child: Text(
          maxLines: 1,
          data.name.toString(),
          style: TextStyle(
            color:  homeController.selectedCategoryIndex.value == selectedIndex  ? Colors.white : Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    ));
  }
}
