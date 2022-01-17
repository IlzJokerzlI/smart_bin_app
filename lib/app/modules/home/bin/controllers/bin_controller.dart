import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smart_bin_app/app/api/api_data.dart';
import 'package:smart_bin_app/app/models/data.dart';
import 'package:smart_bin_app/app/shared/utils/error_display.dart';

class BinController extends GetxController {
  final data = Rx<Data?>(null);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();

    try {
      data.value = await ApiData.getData('esp32a');
    } catch (e) {
      if (e is DioError) {
        displayError('Data Request Failed', e.message.toString());
      } else {
        displayError('Unkown Error', e.toString());
      }
    }
  }

  @override
  void onClose() {}
}
