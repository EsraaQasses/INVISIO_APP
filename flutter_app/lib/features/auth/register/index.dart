// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'controller.dart';

// class RegisterPage extends StatelessWidget {
//   const RegisterPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(RegisterPageController());
//     return Scaffold(

//       body: Form(
//         key: controller.formKey,
//         child: ListView(
//           children: [
//             SizedBox(height: MediaQuery.sizeOf(context).height * .2),
//             // Center(
//               // child: FormField<String>(
//               //     initialValue: controller.image.value,
//               //     validator: (value) {
//               //       if (value!.isEmpty) {
//               //         return "The image is required";
//               //       }
//               //       return null;
//               //     }

//                   builder: (state) {
//                     return Column(
//                       children: [
//                         InkWell(
//                           onTap: () async {
//                             await controller.pickImage();
//                             state.didChange(controller.image.value);
//                           },
//                           child: Obx(
//                             () => controller.image.isEmpty
//                                 ? Container(
//                                     padding: EdgeInsets.all(12),
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                         color: state.hasError
//                                             ? Theme.of(context)
//                                                 .colorScheme
//                                                 .error
//                                             : StyleRepo.black,
//                                       ),
//                                     ),
//                                     child: Icon(
//                                       Icons.person,
//                                       size: 50,
//                                     ),
//                                   )
//                                 : AppImage(
//                                     path: controller.image.value,
//                                     type: ImageType.File,
//                                     height: 80,
//                                     width: 80,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       border: Border.all(),
//                                     ),
//                                   ),
//                           ),
//                         ),
//                         if (state.hasError) SizedBox(height: 8),
//                         if (state.hasError)
//                           Text(
//                             state.errorText!,
//                             style: TextStyle(
//                               color: Theme.of(context).colorScheme.error,
//                               fontSize: 12,
//                             ),
//                           ),
//                       ],
//                     );
//                   }),
//             ),
//             SizedBox(height: 16),
//             TextFormField(
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return "This field is required";
//                 }
//                 if (!value.contains("@")) {
//                   return "Wrong email";
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 16),
//             TextFormField(
//               obscureText: true,
//             ),
//             SizedBox(height: 16),
//             TextFormField(
//               obscureText: true,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: controller.confirm,
//               child: Text("confirm"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invisio_app/core/routes/routes.dart';
import 'package:invisio_app/core/style/repo.dart';
import 'package:invisio_app/core/widgets/image.dart';
import 'package:invisio_app/gen/assets.gen.dart';

import 'controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterPageController());
    return Scaffold(
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
                const SizedBox(height: 35),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Enter your credentials to continue',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 7),
                const Text('Username'),
                const SizedBox(height: 2),
                TextFormField(
                  controller: controller.username,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(
                      color: Colors.grey, // 👈 غيّر اللون هنا كما تريد
                      fontSize: 14, // 👈 يمكن تحديد حجم الخط إذا أردت
                    ),
                    border: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Email'),
                const SizedBox(height: 5),
                TextFormField(
                  controller: controller.email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(
                      color: Colors.grey, // 👈 غيّر اللون هنا كما تريد
                      fontSize: 14, // 👈 يمكن تحديد حجم الخط إذا أردت
                    ),
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
                    hintStyle: TextStyle(
                      color: Colors.grey, // 👈 غيّر اللون هنا كما تريد
                      fontSize: 14, // 👈 يمكن تحديد حجم الخط إذا أردت
                    ),
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
                      'Confirm',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Spacer(),
                // Center(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       const Text("Don't have an account?"),   // button sign up
                //       TextButton(
                //         onPressed: () {
                //           Get.toNamed(Pages.register.value);
                //         },
                //         child: const Text(
                //           'Signup',
                //           style: TextStyle(color: Colors.green),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      // body: Form(
      //   key: controller.formKey,
      //   child: ListView(
      //     children: [
      //       SizedBox(height: MediaQuery.sizeOf(context).height * .2),
      //       // Center(
      //       //   child: FormField<String>(
      //       //       initialValue: controller.image.value,
      //       //       validator: (value) {
      //       //         if (value!.isEmpty) {
      //       //           return "The image is required";
      //       //         }
      //       //         return null;
      //       //       },
      //       //       builder: (state) {
      //       //         return Column(
      //       //           children: [
      //       //             InkWell(
      //       //               onTap: () async {
      //       //                 await controller.pickImage();
      //       //                 state.didChange(controller.image.value);
      //       //               },
      //       //               child: Obx(
      //       //                 () => controller.image.isEmpty
      //       //                     ? Container(
      //       //                         padding: EdgeInsets.all(12),
      //       //                         decoration: BoxDecoration(
      //       //                           shape: BoxShape.circle,
      //       //                           border: Border.all(
      //       //                             color: state.hasError
      //       //                                 ? Theme.of(context)
      //       //                                     .colorScheme
      //       //                                     .error
      //       //                                 : StyleRepo.black,
      //       //                           ),
      //       //                         ),
      //       //                         child: Icon(
      //       //                           Icons.person,
      //       //                           size: 50,
      //       //                         ),
      //       //                       )
      //       //                     : AppImage(
      //       //                         path: controller.image.value,
      //       //                         type: ImageType.File,
      //       //                         height: 80,
      //       //                         width: 80,
      //       //                         decoration: BoxDecoration(
      //       //                           shape: BoxShape.circle,
      //       //                           border: Border.all(),
      //       //                         ),
      //       //                       ),
      //       //               ),
      //       //             ),
      //       //             if (state.hasError) SizedBox(height: 8),
      //       //             if (state.hasError)
      //       //               Text(
      //       //                 state.errorText!,
      //       //                 style: TextStyle(
      //       //                   color: Theme.of(context).colorScheme.error,
      //       //                   fontSize: 12,
      //       //                 ),
      //       //               ),
      //       //           ],
      //       //         );
      //       //       }),
      //       // ),
      //       SizedBox(height: 16),
      //       TextFormField(
      //         validator: (value) {
      //           if (value!.isEmpty) {
      //             return "This field is required";
      //           }
      //           if (!value.contains("@")) {
      //             return "Wrong email";
      //           }
      //           return null;
      //         },
      //       ),
      //       SizedBox(height: 16),
      //       TextFormField(
      //         obscureText: true,
      //       ),
      //       SizedBox(height: 16),
      //       TextFormField(
      //         obscureText: true,
      //       ),
      //       SizedBox(height: 16),
      //       ElevatedButton(
      //         onPressed: controller.confirm,
      //         child: Text("confirm"),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
