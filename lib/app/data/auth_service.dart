import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' hide Response;
import '../../core/network/dio_client.dart';

class AuthService extends GetxService {
  final DioClient _apiService = Get.find<DioClient>();

  // Register
  Future<Response> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await _apiService.dio.post('register', data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      });
      return response;
    } on DioException catch (e) {
      debugPrint(e.toString());
      throw e.response?.data ?? {'error': 'Registration failed'};
    }
  }

  // Login
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiService.dio.post('login', data: {
        'email': email,
        'password': password,
      });
      return response;
    } on DioException catch (e) {
      debugPrint(e.toString());
      throw e.response?.data ?? {'error': 'Login failed'};
    }
  }

  // Logout
  Future<Response> logout() async {
    try {
      final response = await _apiService.dio.post('logout');
      return response;
    } on DioException catch (e) {
      throw e.response?.data ?? {'error': 'Logout failed'};
    }
  }

  // Get User Profile
  Future<Response> getUser() async {
    try {
      final response = await _apiService.dio.get('user');
      return response;
    } on DioException catch (e) {
      throw e.response?.data ?? {'error': 'Failed to get user'};
    }
  }

  // Forgot Password
  Future<Response> forgotPassword(String email) async {
    try {
      final response = await _apiService.dio.post('forgot-password', data: {
        'email': email,
      });
      return response;
    } on DioException catch (e) {
      throw e.response?.data ?? {'error': 'Failed to send reset link'};
    }
  }

  // Reset Password
  Future<Response> resetPassword({
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await _apiService.dio.post('reset-password', data: {
        'email': email,
        'token': token,
        'password': password,
        'password_confirmation': passwordConfirmation,
      });
      return response;
    } on DioException catch (e) {
      throw e.response?.data ?? {'error': 'Password reset failed'};
    }
  }
}