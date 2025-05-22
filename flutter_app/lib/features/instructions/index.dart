import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invisio_app/core/routes/routes.dart';
import 'package:invisio_app/core/style/repo.dart';
import 'package:invisio_app/features/auth/login/controller.dart';
import 'package:invisio_app/gen/assets.gen.dart';

import '../../core/widgets/image.dart';

class InstructionsPage extends StatelessWidget {
  const InstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final hegtht = screenSize.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            // Centered gray square (logo placeholder)
            Center(
              child: AppImage(
                path: Assets.images.photo.path,
                type: ImageType.Asset,
                // fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 24),

            // Description text (adaptive width)
            Container(
              width: width * 0.9,
              child: Text(
                'Invisio helps you analyze news articles and extract key insights using AI.',
                style: TextStyle(
                  fontSize: width * 0.049, // حجم النص نسبي
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 26, 61, 95),
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 24),

            // Steps
            Container(
              width: width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Upload a CSV file of news data',
                    style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                        // color: Color.fromARGB(255, 6, 22, 30),
                        color: const Color.fromARGB(255, 9, 36, 58)),
                  ),
                  Text('2. Run analysis to extract insights',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 9, 36, 58),
                      )),
                  Text('3. View the results',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 9, 36, 58),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Static Table
            Table(
              border: TableBorder.all(
                color: Colors.grey,
              ),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(2),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Headline',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Description',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Date',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Location',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                for (int i = 0; i < 3; i++)
                  TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: StyleRepo.lightGrey,
                          ),
                          height: width * 0.013,
                        ),
                      ),
                      SizedBox(
                        height: hegtht * 0.07,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('...'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('YYYYY-01-DD'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('...'),
                      ),
                    ],
                  ),
              ],
            ),

            const SizedBox(height: 24),

            // Get Started Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //   Get.put(LoginPageController());
                  Get.toNamed(Pages.login.value);
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: StyleRepo.lightblue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
