import 'package:get/get.dart';

import '../controllers/jobdetails_controller.dart';

class JobdetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobdetailsController>(
      () => JobdetailsController(),
    );
  }
}
