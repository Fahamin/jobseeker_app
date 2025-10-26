import 'package:get/get.dart';
import 'package:jobseeker/app/data/home_service.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeService());
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
