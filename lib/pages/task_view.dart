import 'package:flutter/material.dart';
import 'package:getx/constants/colors.dart';
import 'package:get/get.dart';
import 'package:getx/constants/style.dart';
import 'package:getx/constants/widgets.dart';
import 'package:getx/controller/task_controller.dart';


class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyButton(),
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          StackTop(),
          StackBottom(),
        ],
      )),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.find<TaskController>().isediting = false;
        Get.offNamed("ADDTASK");
      },
      backgroundColor: MYgrey,
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}

class StackTop extends StatelessWidget {
  const StackTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: MYgrey,
      height: Get.height,
      child: Column(
        children: [
          Container(
            width: Get.width,
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(right: 20, top: 5),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Icon(Icons.add_task),
            ),
          ),
          Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 35, top: 10),
              child: Text(
                "همه",
                style: TittleStyle,
              )),
          Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 45, top: 10),
              child: Obx(() {
                return Text(
                  "وظایف:${Get.find<TaskController>().tasks.length}",
                  style: SubTittlegray,
                );
              }))
        ],
      ),
    );
  }
}

class StackBottom extends StatelessWidget {
  const StackBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Colors.white,
      ),
      width: Get.width,
      height: Get.height < 750 ? 250 : Get.height * 73 / 100,
      child: Obx(() {
        return ListView.builder(
          itemCount: Get.find<TaskController>().tasks.length,
          itemBuilder: (context, index) => MyListTile(
            ontap: () {
              Get.find<TaskController>().index = index;
              Get.find<TaskController>().isediting = true;
              Get.offNamed("ADDTASK");
            },
            val: Get.find<TaskController>().tasks[index].status,
            text: Get.find<TaskController>().tasks[index].tasktittle,
            subtext: Get.find<TaskController>().tasks[index].taskdatetime,
            oncheckboxchange: (v) {
              Get.find<TaskController>().tasks[index].status =
              !Get.find<TaskController>().tasks[index].status;
              Get.find<TaskController>().tasks[index] =  Get.find<TaskController>().tasks[index];
            },
            ondeletetap: () {
              Get.find<TaskController>().tasks.removeAt(index);
            },
          ),
        );
      }),
    );
  }
}
