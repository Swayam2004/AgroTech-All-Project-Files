import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YieldOptimizationController extends GetxController {
  static YieldOptimizationController get instance => Get.find();

  // TextField Controllers to get data from TextFields
  final landArea = TextEditingController();
  final expectedProduction = TextEditingController();
  final cropType = TextEditingController();
  final season = TextEditingController();
  final state = TextEditingController();
}
