import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jobseeker/app/model/jobModel.dart';

import '../../../data/job_service.dart';
import '../../../model/category_model.dart';

class JoblistbycategoryController extends GetxController {
  var jobService = Get.find<JobService>();
  var isLoading = false.obs;
  var joblist = <Jobcatlist>[].obs;

  Future<void> getJobByCategory(var categoryId) async {
    try {
      isLoading.value = true;
      final res = await jobService.getJobsListByCategory(
        categoryId,
      ); // res.data = Map<String,dynamic>
      debugPrint("res.data: ${res.data}");
      // Map থেকে CategoryModel তৈরি
      final jobModel = JobModel.fromJson(res.data);

      joblist.value = jobModel.jobcatlist ?? [];
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
