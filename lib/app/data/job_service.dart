import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_connect/http/src/response/response.dart' hide Response;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../../core/network/dio_client.dart';

class JobService  extends GetxService {
  final DioClient _apiService = Get.find<DioClient>();

  Future<Response> getCategories() async {
    try {
      final response = await _apiService.dio.get('categories');
      return response;
    } on DioException catch (e) {
      throw e.response?.data ?? {'error': 'Failed to get user'};
    }
  }

  Future<Response> getJobsListByCategory(String categoryId) async {
    try {
      final response = await _apiService.dio.get('categories/$categoryId/jobs');
      return response;
    } on DioException catch (e) {
      throw e.response?.data ?? {'error': 'Failed to get user'};
    }
  }

  Future<Response> getJobsDetailsByID(String id) async {
    try {
      final response = await _apiService.dio.get('job-posts/$id');
      return response;
    } on DioException catch (e) {
      throw e.response?.data ?? {'error': 'Failed to get user'};
    }
  }
}