import 'package:get/get.dart';
import 'package:smart_bin_app/app/routes/app_pages.dart';

class HomeController extends GetxController {
  void onOpenBin() {
    Get.toNamed(Routes.BIN);
  }
}
