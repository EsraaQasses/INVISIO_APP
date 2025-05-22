// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invisio_app/features/analyze/index.dart';
import 'package:invisio_app/features/analyze1/index.dart';
import 'package:invisio_app/features/auth/login/index.dart';
import 'package:invisio_app/features/auth/register/index.dart';
import 'package:invisio_app/features/instructions/index.dart';
import 'package:invisio_app/features/main/index.dart';
import 'package:invisio_app/features/splash/index.dart';
// import 'package:shop_app/features/auth/register/index.dart';
// // import 'package:shop_app/features/main/index.dart';

// import '../../features/auth/login/index.dart';

// import '../../features/splash/index.dart';

class AppRouting {
  static GetPage unknownRoute =
      GetPage(name: "/unknown", page: () => SizedBox());

  static GetPage initialRoute = GetPage(
    name: "/",
    page: () => SplashScreen(),
    //  AnalyzePage(),
    // LoginPage()
  );

  static List<GetPage> routes = [
    initialRoute,
    ...Pages.values.map((e) => e.page),
  ];
}

enum Pages {
  instructions,
  analyze,
  // //Auth
  login,
  register,
  // //
  home,
  analyze1
  // product_details,
  // products,
  // //
  ;

  String get value => '/$name';

  GetPage get page => switch (this) {
        login => GetPage(
            name: value,
            page: () => LoginPage(),
          ),
        instructions => GetPage(
            name: value,
            page: () => InstructionsPage(),
          ),
        analyze => GetPage(
            name: value,
            page: () => AnalyzePage(),
          ),
        analyze1 => GetPage(
            name: value,
            page: () => Analyze1Page(),
          ),
        register => GetPage(
            name: value,
            page: () => RegisterPage(),
          ),
        home => GetPage(
            name: value,
            page: () => MainPage(),
          ),
        // product_details => GetPage(
        //     name: value,
        //     page: () => ProductDetailsPage(),
        //   ),
        // products => GetPage(
        //     name: value,
        //     page: () => ProductsPage(),
        //   ),
      };
}
