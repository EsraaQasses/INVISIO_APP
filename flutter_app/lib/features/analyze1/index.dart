import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invisio_app/features/analyze/controller.dart';
import 'package:invisio_app/features/analyze1/controller.dart';

class Analyze1Page extends StatelessWidget {
  const Analyze1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final AnalyzeController controller = Get.find();
    //  final controller = Get.put(Analyze1Controller());
    return ListView(
      children: [Text(controller.jsonResult.value)],
    );
  }
}
