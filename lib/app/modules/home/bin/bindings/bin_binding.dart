import 'package:get/get.dart';

import '../controllers/bin_controller.dart';

class BinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BinController>(
      () => BinController(),
    );
  }
}
