import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseeker/app/modules/home/controllers/home_controller.dart';
import '../../../../core/wigets/appbar/appbar.dart';
import '../controllers/joblistbycategory_controller.dart';
import '../widgets/job_card_horizontal.dart';
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
          Flexible(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: homeController.categorylist.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var job = homeController.categorylist[index];
                        return GestureDetector(
                          onTap: () {
                            controller.getJobByCategory(job.id.toString());
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
                Expanded(
                  flex: 17,
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (controller.joblist.isEmpty) {
                      return const Center(child: Text('No jobs found'));
                    }

                    return ListView.builder(
                      itemCount: controller.joblist.length,
                      itemBuilder: (context, index) {
                        final job = controller.joblist[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: JobCardHorizontal(model: job),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
