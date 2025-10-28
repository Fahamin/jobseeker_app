import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:get/get_core/src/get_main.dart';
import 'package:jobseeker/app/model/category_model.dart';

import '../../core/network/dio_client.dart';

class HomeService extends GetxService {
  final DioClient _apiService = Get.find<DioClient>();

  Future<Response> getCategories() async {
    try {
      final response = await _apiService.dio.get('categories');
      return response;
    } on DioException catch (e) {
      throw e.response?.data ?? {'error': 'Failed to get user'};
    }
  }

  Future<Response> getJobsList() async {
    try {
      final response = await _apiService.dio.get('job-posts');
      return response;
    } on DioException catch (e) {
      throw e.response?.data ?? {'error': 'Failed to get user'};
    }
  }
}