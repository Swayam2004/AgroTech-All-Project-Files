import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CropRecommendController extends GetxController {
  static CropRecommendController get instance => Get.find();

  // TextField Controllers to get data from TextFields
  final pValue = TextEditingController();
  final nValue = TextEditingController();
  final kValue = TextEditingController();
  final temperature = TextEditingController();
  final humidity = TextEditingController();
  final phLevel = TextEditingController();
  final rainfall = TextEditingController();
}
