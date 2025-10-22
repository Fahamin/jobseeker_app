import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/auth_service.dart';


class LoginController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var user = {}.obs;

  @override
  void onInit() {
    super.onInit();
    checkAuthStatus();
  }

  // Check if user is already logged in
  Future<void> checkAuthStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');

      if (token != null) {
        // Verify token by getting user profile
        await getUserProfile();
        isLoggedIn.value = true;
      }
    } catch (e) {
      await logout();
    }
  }

  // Register
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      isLoading.value = true;
      final response = await _authService.register(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

      if (response.statusCode == 201) {
        await _saveAuthData(response.data);
        Get.offAllNamed('/home');
        Get.snackbar('Success', 'Registration successful!');
      }
    } catch (e) {
      final error = e is Map ? e['errors'] ?? e : {'error': 'Registration failed'};
      Get.snackbar('Error', error.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Login
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      final response = await _authService.login(
        email: email,
        password: password,
      );

      if (response.statusCode == 200) {
        await _saveAuthData(response.data);
        Get.offAllNamed('/home');
        Get.snackbar('Success', 'Login successful!');
      }
    } catch (e) {
      final error = e is Map ? e['errors'] ?? e : {'error': 'Login failed'};
      Get.snackbar('Error', error.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await _authService.logout();
    } catch (e) {
      // Continue with logout even if API call fails
    } finally {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('auth_token');
      await prefs.remove('user_data');

      isLoggedIn.value = false;
      user.value = {};
      Get.offAllNamed('/login');
    }
  }

  // Get User Profile
  Future<void> getUserProfile() async {
    try {
      final response = await _authService.getUser();
      user.value = response.data;

      // Update local storage
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_data', json.encode(response.data));
    } catch (e) {
      await logout();
    }
  }

  // Forgot Password
  Future<void> forgotPassword(String email) async {
    try {
      isLoading.value = true;
      final response = await _authService.forgotPassword(email);

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Password reset link sent to your email!');
        Get.back();
      }
    } catch (e) {
      final error = e is Map ? e['message'] ?? e : {'error': 'Failed to send reset link'};
      Get.snackbar('Error', error.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Reset Password
  Future<void> resetPassword({
    required String email,
    required String token,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      isLoading.value = true;
      final response = await _authService.resetPassword(
        email: email,
        token: token,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Password reset successful!');
        Get.offAllNamed('/login');
      }
    } catch (e) {
      final error = e is Map ? e['message'] ?? e : {'error': 'Password reset failed'};
      Get.snackbar('Error', error.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Save auth data to local storage
  Future<void> _saveAuthData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', data['token']);
    await prefs.setString('user_data', json.encode(data['user']));

    user.value = data['user'];
    isLoggedIn.value = true;
  }
}