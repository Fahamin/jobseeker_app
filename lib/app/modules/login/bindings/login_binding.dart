import 'package:get/get.dart';

import '../../../data/api_service.dart';
import '../../../data/auth_service.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService());
    Get.lazyPut(() => AuthService());
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );

  }
}
