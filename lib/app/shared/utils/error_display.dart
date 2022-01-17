import 'package:get/get.dart';

Future<void> displayError(String title, String content) async {
  await Get.defaultDialog(
    title: title,
    middleText: content,
    onConfirm: () => Get.back(),
  );
}
