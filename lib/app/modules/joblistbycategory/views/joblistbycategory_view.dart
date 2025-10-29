import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseeker/app/modules/home/controllers/home_controller.dart';
import '../../../../core/wigets/appbar/appbar.dart';
import '../controllers/joblistbycategory_controller.dart';
import '../widgets/text_horizontal_list.dart';

class JoblistbycategoryView extends GetView<JoblistbycategoryController> {
  const JoblistbycategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    Future.microtask(() => homeController.getCategory());
    return Scaffold(
      appBar: HkAppBar(showBackArrow: true, title: Text('Job List')),
      body: Column(
        children: [

          SizedBox(
            height: 50,
            child: Obx(() {
              return ListView.builder(
                itemCount: homeController.categorylist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var job = homeController.categorylist[index];
                  return InkWell(
                    onTap: () {
                     homeController.selectCategory(index);
                     debugPrint(index.toString());
                    },
                    child: TextHorizontalList(
                        data: job,
                      selectedIndex: index,
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
