import 'package:get/get.dart';

import '../../../../core/network/dio_client.dart';
import '../../../data/auth_service.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DioClient());
    Get.lazyPut(() => AuthService());
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );

  }
}
