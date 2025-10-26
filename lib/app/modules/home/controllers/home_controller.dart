import 'package:get/get.dart';
import 'package:jobseeker/app/data/home_service.dart';
import 'package:jobseeker/app/model/category_model.dart';
import 'package:jobseeker/app/model/user_model.dart';
import 'package:jobseeker/app/modules/home/widgets/category_item.dart';

import '../../../data/auth_service.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var user = UserModel().obs;
  var categorylist = <CategoryItem>[].obs;

  final _authService = Get.find<AuthService>();
  final _homeService = Get.find<HomeService>();

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  Future<void> getCategory() async {
    try {
      isLoading.value = true;
      // ধরুন getUser() সরাসরি Map<String, dynamic> রিটার্ন করে
      final res = await _homeService.getCategories();
      categorylist.value = res.data;
    } catch (e) {
      user.value = UserModel(); // empty user
      print("Error fetching user: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchUser() async {
    try {
      isLoading.value = true;
      // ধরুন getUser() সরাসরি Map<String, dynamic> রিটার্ন করে
      final res = await _authService.getUser();
      user.value = UserModel.fromJson(res.data);
    } catch (e) {
      user.value = UserModel(); // empty user
      print("Error fetching user: $e");
    } finally {
      isLoading.value = false;
    }
  }
}