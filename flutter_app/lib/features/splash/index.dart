// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:invisio_app/core/style/repo.dart';
// import 'package:invisio_app/core/widgets/image.dart';
// import 'package:invisio_app/gen/assets.gen.dart';

// import 'controller.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(SplashScreenController());

//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: StyleRepo.white,
//       body: Column(
//         children: [
//           Positioned(
//             top: screenHeight / 2 -
//                 175, // تعديل عمودي (نصف الشاشة ناقص نصف ارتفاع الصورة التقريبي)
//             left: screenWidth / 2 -
//                 175, // تعديل أفقي (نصف الشاشة ناقص نصف عرض الصورة التقريبي)
//             child: SizedBox(
//               width: 350, // عرض الصورة
//               height: 350, // ارتفاع الصورة
//               child: AppImage(
//                 path: Assets.images.photo.path,
//                 type: ImageType.Asset,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package\:flutter/material.dart';
import 'package\:get/get.dart';
import 'package\:invisio\_app/core/style/repo.dart';
import 'package\:invisio\_app/core/widgets/image.dart';
import 'package\:invisio\_app/gen/assets.gen.dart';

import 'controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashScreenController());
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Expanded(
          child: Container(
            color: StyleRepo.white,
            child: Center(
              child: AppImage(
                height: screenHeight * 0.3,
                width: screenWidth * 0.7,
                path: Assets.images.logo.path,
                type: ImageType.Asset,
                fit: BoxFit.contain,
              ),
            ),
          ),
        )
      ],
    );
  }
}
