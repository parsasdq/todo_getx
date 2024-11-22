import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/constants/colors.dart';

import 'package:getx/constants/widgets.dart';
import 'package:getx/controller/task_controller.dart';
import 'package:getx/controller/text_controller.dart';
import 'package:getx/models/task_model.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            MYTextfield(
              hint: "وظیفه جدید را وارد کنید",
              controller: Get.find<TextController>().tasktittle,
            ),
            MYTextfield(
              hint: "توضیحات وظیفه را وارد کنید",
              controller: Get.find<TextController>().time,
            ),
            MYButton()
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: MYText(text: "وظیفه جدید", style: textstyle.tittle)),
          IconButton(
              icon: MYIcon(
                icon: Icons.close,
              ),
              onPressed: () {
                Get.offNamed("/TASK");
              })
        ],
      ),
    );
  }
}

class MYButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !Get.find<TaskController>().isediting
        ? InkWell(
            onTap: () {
              Get.find<TaskController>().tasks.add(TaskModel(
                  taskdatetime: Get.find<TextController>().time.text.toString(),
                  tasktittle:
                      Get.find<TextController>().tasktittle.text.toString(),
                  status: false,
                  index: Get.find<TaskController>().index));
              Get.find<TextController>().tasktittle.text = '';
              Get.find<TextController>().time.text = '';
              Get.offNamed("/TASK");
            },
            child: Container(
              margin: EdgeInsets.all(10),
              color: MYgrey,
              width: Get.width,
              child: MYText(
                text: "ایجاد",
                style: textstyle.tittle,
                color: Colors.white,
              ),
            ),
          )
        : InkWell(
            onTap: () {
              var task = Get.find<TaskController>().tasks[Get.find<TaskController>().index];
              Get.find<TaskController>()
                  .tasks
                  .removeAt(Get.find<TaskController>().index);
              Get.find<TaskController>().tasks.insert(
                  Get.find<TaskController>().index,
                  TaskModel(
                      taskdatetime: Get.find<TextController>().time.text != ""
                          ? Get.find<TextController>().time.text.toString()
                          : task.taskdatetime,
                      tasktittle:
                          Get.find<TextController>().tasktittle.text != ""
                              ? Get.find<TextController>()
                                  .tasktittle
                                  .text
                                  .toString()
                              : task.tasktittle,
                      index: Get.find<TaskController>().index,
                      status: false));
              Get.find<TextController>().tasktittle.text = '';
              Get.find<TextController>().time.text = '';
              Get.find<TaskController>().isediting = false;
              Get.offNamed("TASK");
            },
            child: Container(
              margin: EdgeInsets.all(10),
              color: MYgrey,
              width: Get.width,
              child: MYText(
                text: "ویرایش",
                style: textstyle.tittle,
                color: Colors.white,
              ),
            ),
          );
  }
}
