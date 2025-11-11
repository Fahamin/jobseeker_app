import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jobseeker/app/model/job_details_model.dart';

import '../../../data/job_service.dart';
import '../../../model/jobModel.dart';

class JobdetailsController extends GetxController {
  var jobService = Get.find<JobService>();
  var isLoading = false.obs;
  var job=JobDetailsModel().obs;

  Future<void> getJobByCategory(var categoryId) async {
    try {
      isLoading.value = true;
      final res = await jobService.getJobsDetailsByID(
        categoryId,
      ); // res.data = Map<String,dynamic>
      debugPrint("res.data: ${res.data}");
      // Map থেকে CategoryModel তৈরি
      final jobModel = JobDetailsModel.fromJson(res.data);

      job.value = jobModel;
    } catch (e) {
      print("Error fetching categories: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
