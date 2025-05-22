import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:invisio_app/core/routes/routes.dart';
import 'package:invisio_app/core/services/rest_api/api_service.dart';
import 'package:invisio_app/core/services/rest_api/constants/end_points.dart';
import 'package:invisio_app/core/services/rest_api/models/request.dart';
import 'package:invisio_app/core/services/rest_api/models/response_model.dart';
// import 'package:image_picker/image_picker.dart';

class RegisterPageController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController username, email, password;

  @override
  onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    super.onInit();
  }

  @override
  onClose() {
    username.dispose();
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
        endPoint: EndPoints.register,
        method: RequestMethod.Post,
        params: {"success": true},
        body: (
          {
            //  " " متل مو مكتوبة بال باك
            "email": email.text,
            "password": password.text,
          },
        ),
      ),
    );
    if (response.success) {
    } else {}
  }
}
