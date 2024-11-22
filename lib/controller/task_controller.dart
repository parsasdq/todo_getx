import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/models/task_model.dart';

class TaskController extends GetxController {
  RxList<TaskModel> tasks = <TaskModel>[].obs;
  int index = 0;
  bool isediting = false;
  var box =  GetStorage();
  @override
  void onInit() async {
    if (box.read("tasks") != null) {
      var list = await box.read("tasks");
      for (var i in list) {
        tasks.add(TaskModel.fromJson(i));
      }
    }
    ever(tasks, (v) {
      box.write("tasks", tasks.toJson());
    });
    super.onInit();
  }
}
