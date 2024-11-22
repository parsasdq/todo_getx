import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  TextEditingController tasktittle=TextEditingController();
  TextEditingController time=TextEditingController();
  @override
  void onInit() {
    tasktittle = TextEditingController();
    time = TextEditingController();
    super.onInit();
  }
}
