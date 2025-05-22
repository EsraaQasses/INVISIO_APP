import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invisio_app/core/widgets/image.dart';
import 'package:invisio_app/features/analyze/controller.dart';
import 'package:invisio_app/core/style/repo.dart';
import 'package:invisio_app/features/analyze1/index.dart';
import 'package:invisio_app/gen/assets.gen.dart';

class AnalyzePage extends StatelessWidget {
  final AnalyzeController controller = Get.put(AnalyzeController());

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("upload CSV or Excel")),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             ElevatedButton(
// //               onPressed: controller.pickAndConvertFile,
// //               child: Text(" choice CSV or Excel file"),
// //             ),
// //             SizedBox(height: 20),
// //             Expanded(
// //               child: Obx(() => SingleChildScrollView(
// //                     child: SelectableText(
// //                       controller.jsonResult.value.isNotEmpty
// //                           ? controller.jsonResult.value
// //                           : "لم يتم رفع ملف بعد.",
// //                     ),
// //                   )),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

  @override
  Widget build(BuildContext context) {
    // نحصل على أبعاد الشاشة
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02), // مسافة فوق الشعار
            // شعار التطبيق

            AppImage(
              width: 300,
              height: 300,
              path: Assets.images.photo.path,
              type: ImageType.Asset,
              fit: BoxFit.contain,
            ),

            SizedBox(height: screenHeight * 0.015), // مسافة تحت الشعار
            // النص الرئيسي
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Text(
                "Upload a CSV file of\nnews articles and extract\nkey insights using AI",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.055, // حجم النص نسبي
                  fontWeight: FontWeight.bold,
                  color: StyleRepo.blue,
                  //Color(0xFF1D2A58),
                ),
              ),
            ),
            Spacer(), // يدفع العناصر لأسفل
            // حقل رفع الملف
            // Row(
            //   children: [
            //     Expanded(
            //       child: Obx(() => SingleChildScrollView(
            //             child: SelectableText(
            //               controller.jsonResult.value.isNotEmpty
            //                   ? controller.jsonResult.value
            //                   : "لم يتم رفع ملف بعد.",
            //             ),
            //           )),
            //     ),
            //   ],
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: controller.pickAndConvertFile,
                        icon: Icon(
                          Icons.attach_file,
                          color: Colors.grey,
                        )),
                    // Icon(Icons.attach_file, color: Colors.grey,),
                    SizedBox(width: 8),
                    Text(
                      "No file chosen",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Spacer(),
                    // ElevatedButton(
                    //   onPressed: () => Get.to(Analyze1Page()),
                    //   child: Icon(
                    //     Icons.upload,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    Icon(Icons.upload, color: Colors.blue),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            // شريط التنقل السفلي
          ],
        ),
      ),
    );
  }
}

//
