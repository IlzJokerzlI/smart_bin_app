import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smart_bin_app/app/api/api_data.dart';
import 'package:smart_bin_app/app/models/data.dart';
import 'package:smart_bin_app/app/shared/utils/error_display.dart';

class BinController extends GetxController {
  final deviceId = 'esp32a';
  final data = Rx<Data?>(null);
  final isRefreshLoading = true.obs;

  @override
  void onReady() async {
    super.onReady();
    await onGetData();
  }

  @override
  void onClose() {}

  Future<void> onGetData() async {
    isRefreshLoading.value = true;
    try {
      data.value = await ApiData.getData(deviceId);
    } catch (e) {
      if (e is DioError) {
        displayError('Data Request Failed', e.message.toString());
      } else {
        displayError('Unkown Error', e.toString());
      }
    }
    isRefreshLoading.value = false;
  }
}
