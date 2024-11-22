import 'package:get/get.dart';
import 'package:getx/main.dart';
import 'package:getx/pages/add_task.dart';
import 'package:getx/pages/Task_view.dart';

class GetRoutes{
 List<GetPage> get getpages=>  [
  GetPage(name: "/TASK", page: () => TaskView()),
  GetPage(name: "/SPLASH", page: ()=> Splash()),
  GetPage(name: "/ADDTASK", page:()=> AddTaskView()),

];
}