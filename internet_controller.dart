import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectvityStatus);
  }

  void _updateConnectvityStatus(List<ConnectivityResult> connectivityResults) {
    if (connectivityResults.contains(ConnectivityResult.none)) {
      Get.rawSnackbar(
          title: "No Internet",
          message: "Please check your internet connection.",
          isDismissible: false,
          backgroundColor: Colors.red,
          duration: const Duration(hours: 1),
          snackStyle: SnackStyle.GROUNDED);
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}

class InternetConnectivityStatusInjection {
  static void init() {
    Get.put<NetworkController>(permanent: true, NetworkController());
  }
}
