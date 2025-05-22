import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invisio_app/core/config/app_builder.dart';
import 'package:invisio_app/core/config/role.dart';
import 'package:invisio_app/core/routes/routes.dart';
import 'package:invisio_app/core/services/rest_api/api_service.dart';
import 'package:invisio_app/core/services/rest_api/constants/end_points.dart';
import 'package:invisio_app/core/services/rest_api/models/request.dart';
import 'package:invisio_app/core/services/rest_api/models/response_model.dart';

class LoginPageController extends GetxController {
  AppBuilder appBuilder = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController email, password;

  @override
  onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  confirm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    ResponseModel response = await APIService.instance.request(
      Request(
        endPoint: EndPoints.login,
        method: RequestMethod.Post,
        // params: {"success": true},
        body: {
          "email": email.text,
          "password": password.text,
        },
      ),
    );
    if (response.success) {
      appBuilder.setRole(Role.user);
      appBuilder
          .setToken(response.data['access_token']); //شوف هي  الريسبونس اللي

      Get.toNamed(Pages.home.value);
    } else {}
  }
}


    // Get.toNamed(Pages.home.value);

    