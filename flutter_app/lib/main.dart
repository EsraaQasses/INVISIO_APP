// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:excel/excel.dart';
// import 'package:get/get.dart';
// import 'package:invisio_app/analyze/index.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Excel & CSV Uploader',
//       debugShowCheckedModeBanner: false,
//       home: AnalyzePage(), // ← هنا تستدعي الواجهة
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invisio_app/core/config/app_builder.dart';
import 'package:invisio_app/features/analyze/controller.dart';
import 'package:invisio_app/features/auth/login/controller.dart';
import 'package:invisio_app/core/routes/routes.dart';
import 'package:invisio_app/core/style/style.dart';
import 'package:invisio_app/features/splash/controller.dart';

main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  Get.put(APIService());
    Get.put(AppBuilder());
    // final SplashScreenController controller = Get.put(SplashScreenController());

    // final AnalyzeController controller = Get.put(AnalyzeController());
    // final LoginPageController controller = Get.put(LoginPageController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppStyle.theme,

      //
      initialRoute: '/',
      unknownRoute: AppRouting.unknownRoute,
      getPages: AppRouting.routes,
    );
  }
}
