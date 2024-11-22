

class TaskModel {
  String tasktittle;
  String taskdatetime;
  bool status;
  int index;
  TaskModel(
      {required this.taskdatetime,
      required this.tasktittle,
      required this.status,
      required this.index});
  Map<String, dynamic> toJson() {
    return {
      "taskdatetime": taskdatetime,
      "tasktittle": tasktittle,
      "status": status,
      "index": index
    };
  }

  TaskModel.fromJson(Map<String, dynamic> json)
      : tasktittle = json["tasktittle"],
        taskdatetime = json["taskdatetime"],
        status = json["status"],
        index = json["index"];
}
