import 'package:get/get.dart';
import 'package:jobseeker/app/data/home_service.dart';

import '../../../../core/network/dio_client.dart';
import '../../../data/auth_service.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DioClient());
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => HomeService());

    Get.lazyPut<LoginController>(
      () => LoginController(),
    );

  }
}
