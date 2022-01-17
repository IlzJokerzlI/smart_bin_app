import 'package:get/get.dart';

import '../modules/home/bin/bindings/bin_binding.dart';
import '../modules/home/bin/views/bin_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.BIN,
          page: () => BinView(),
          binding: BinBinding(),
        ),
      ],
    ),
  ];
}
