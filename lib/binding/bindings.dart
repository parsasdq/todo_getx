import 'package:get/get.dart';
import 'package:getx/controller/task_controller.dart';
import 'package:getx/controller/text_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(TaskController());
    Get.put(TextController());
  }
}
