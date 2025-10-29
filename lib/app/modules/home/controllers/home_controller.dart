import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobseeker/app/data/home_service.dart';
import 'package:jobseeker/app/model/category_model.dart';
import 'package:jobseeker/app/model/job_list_model.dart'  hide Data;
import 'package:jobseeker/app/model/user_model.dart';
import 'package:jobseeker/app/modules/home/widgets/category_card_vertical.dart';

import '../../../data/auth_service.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var user = UserModel().obs;
  var categorylist = <Data>[].obs;
  var joblist = <Joblist>[].obs;

  final _authService = Get.find<AuthService>();
  final _homeService = Get.find<HomeService>();
  var selectedCategoryIndex = (-1).obs;
  @override
  void onInit() {
    super.onInit();
    fetchUser();

  }
  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  Future<void> getJobsList() async {
    try {
      isLoading.value = true;
      final res = await _homeService.getJobsList(); // res.data = Map<String,dynamic>

      // Map থেকে CategoryModel তৈরি
      final jobModel = JobListModel.fromJson(res.data);

      // RxList<Data> কে assign করা
      joblist.value = jobModel.joblist ?? [];
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> getCategory() async {
    try {
      isLoading.value = true;
      final res = await _homeService.getCategories(); // res.data = Map<String,dynamic>

      // Map থেকে CategoryModel তৈরি
      final categoryModel = CategoryModel.fromJson(res.data);

      // RxList<Data> কে assign করা
      categorylist.value = categoryModel.data ?? [];
    } catch (e) {
      print("Error fetching categories: $e");
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

  final List<IconData> icons = [
    Icons.remember_me_rounded,
    Icons.restart_alt_rounded,
    Icons.star,
    Icons.handshake_rounded,
    Icons.back_hand_sharp,
    Icons.shopping_cart,
    Icons.nature,
    Icons.wallet_giftcard_outlined,
  ];

  IconData getRandomIcon() {
    final random =  Random();
    return icons[random.nextInt(icons.length)];
  }

}