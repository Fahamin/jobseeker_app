import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:jobseeker/app/modules/login/controllers/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constance/environment.dart';

class DioClient extends GetxService {
  late Dio _dio;

  @override
  void onInit() {
    super.onInit();
    _dio = Dio(BaseOptions(
      baseUrl: Environment.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

    // Add interceptors for auth token
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Get token from storage
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('auth_token');

        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        options.headers['Content-Type'] = 'application/json';
        options.headers['Accept'] = 'application/json';
        return handler.next(options);
      },
      onError: (DioException error, handler) {
        if (error.response?.statusCode == 401) {
          // Token expired or invalid
          Get.find<LoginController>().logout();
        }
        return handler.next(error);
      },
    ));
  }

  Dio get dio => _dio;
}