import 'package:get/get.dart';

import '../controllers/joblistbycategory_controller.dart';

class JoblistbycategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JoblistbycategoryController>(
      () => JoblistbycategoryController(),
    );
  }
}
