import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invisio_app/core/routes/routes.dart';
import 'package:invisio_app/core/style/repo.dart';
import 'package:invisio_app/core/widgets/image.dart';
import 'package:invisio_app/gen/assets.gen.dart';

import 'controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginPageController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: ListView(
              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: AppImage(
                    path: Assets.images.photo.path,
                    type: ImageType.Asset,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Enter your email and password',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                const Text('Email'),
                const SizedBox(height: 5),
                TextFormField(
                  controller: controller.email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    border: UnderlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field is required";
                    }
                    if (!value.contains("@")) {
                      return "Invalid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text('Password'),
                const SizedBox(height: 5),
                TextFormField(
                  controller: controller.password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                    border: UnderlineInputBorder(),
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field is required";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: controller.confirm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: StyleRepo.lightblue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Spacer(),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Pages.register.value);
                        },
                        child: const Text(
                          'Signup',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
