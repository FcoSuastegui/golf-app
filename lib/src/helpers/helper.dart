import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper {
  static final Helper _instancia = new Helper._internal();
  factory Helper() => _instancia;
  Helper._internal();

  static Future<void> success({
    String title: 'Club de Golf',
    @required String message,
  }) async {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }

  static Future<void> error({
    String title: 'Club de Golf',
    @required String message,
  }) async {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }

  static Future<void> warning({
    String title: 'Club de Golf',
    @required String message,
  }) async {
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.yellow.withOpacity(0.8),
        colorText: Colors.white,
      );
    }
  }
}
