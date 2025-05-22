// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invisio_app/core/style/repo.dart';
import 'package:invisio_app/core/widgets/svg_icon.dart';
import 'package:invisio_app/gen/assets.gen.dart';
// import 'package:shop_app/core/localization/strings.dart';
// import 'package:shop_app/core/widgets/svg_icon.dart';
// import 'package:shop_app/gen/assets.gen.dart';
import 'package:invisio_app/gen/assets.gen.dart';

import '../controller.dart';

//11
class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
  });
// بدنا مكتبة كرمال تقرأ صور اس في جي
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<
        MainPageController>(); // جواتا انستنس من اسم الكونترولر لي عم اربط معواذا ساوينا هون انجكت للكونترولر
    // MainPageController controller = Get.find();// الفايند لحالو عرف ع مين عم دور
    return Obx(
      // معناتا هي أنو أنا في جواتي قيمة أر اكس لو مافي قيمة ار اكس جوا بيضرب
      // فينا نحط قيمتين أر اكس وبرفرش عالتنين ولكن الافضل تكون وحدة
      // مجرد انو حط او بي اكس فوق الواجهة لحالو بيعرف مين بدو يرفرش
      () => NavigationBar(
        backgroundColor: StyleRepo.white,
        onDestinationSelected: (page) => controller.currentPage.value = page,
        selectedIndex: controller.currentPage.value,
        // هلأ شو عرفو أنو لازم يعمل ري بيلد بدنا واجهة
        // هي الواجهة هية بتعمل لسن على الأر اكس
        destinations: [
          NavigationDestination(
            icon: SvgIcon(
              color: StyleRepo.blue,
              icon: Assets.icons.home,
            ),
            // icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: SvgIcon(
              icon: Assets.icons.analyze,
              color: StyleRepo.blue,
            ),
            label: "Analyze",
          ),
          NavigationDestination(
            // icon: SvgIcon(icon: Assets.icons.cart  ),
            icon: Icon(
              Icons.add_chart_outlined,
              color: StyleRepo.blue,
            ),
            label: "Suggestions",
          ),
          NavigationDestination(
            icon: SvgIcon(
              icon: Assets.icons.profile1,
              color: StyleRepo.blue,
            ),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
// انا فيني اعمل اينام مين بيج  دستنيشن بقلبو خمس قيم بتعبر عن الصفحة اللي أنا فيها بس هلأ مارح اعمل هيك رح كرر الكتابة اسهل
