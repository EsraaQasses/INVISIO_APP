import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invisio_app/features/analyze/index.dart';
import 'package:invisio_app/core/style/repo.dart';
import 'package:invisio_app/features/main/controller.dart';

import 'widgets/nav_bar.dart';

//8
// دائما منسمي الصفحة باسما مع كلمة بيج
// والكونترولر مع كلمة كونترولر
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainPageController());
    return Scaffold(
      bottomNavigationBar: NavBar(),
      body: Obx(
        () => switch (controller.currentPage.value) {
          1 => AnalyzePage(),
          //  3 => FavoritesPage(),
          _ => ColoredBox(color: StyleRepo.green),
        },
      ),
    );
  }
}
