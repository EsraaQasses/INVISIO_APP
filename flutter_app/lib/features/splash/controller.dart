import 'package:get/get.dart';
import 'package:invisio_app/core/routes/routes.dart';

class SplashScreenController extends GetxController {
  loadData() async {
    await 5.seconds.delay();
    // await Future.delayed(Duration(seconds: 2));
    // Get.toNamed(Pages.login.value);
    Get.toNamed(Pages.instructions.value);
  }

  @override
  void onInit() {
    loadData();
    super.onInit();
  }
}
