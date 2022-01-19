import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smart_bin_app/app/shared/constants/app_colors.dart';

import 'app/routes/app_pages.dart';

// TODO: Remove [HttpOverrides]
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  // TODO: Remove this line (allow all SSL)
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.green,
        iconTheme: const IconThemeData(color: AppColors.black),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: AppColors.black),
          subtitle1: TextStyle(color: AppColors.black),
        ),
      ),
    ),
  );
}
