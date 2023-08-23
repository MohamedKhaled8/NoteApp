import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/core/model/task_model.dart';
import 'package:noteapp/core/helper/db/db_helper.dart';

abstract class HomeController extends GetxController {
  getDataFromUser(BuildContext context);
  getTimeFromUser({required bool isStartTime, required BuildContext context});
  showTimePickerUser(BuildContext context);
  selectRemindFun(String? newValue);
  selectRepeatFun(String? newValue);
  selectedColor(index);
  vailedDataFiedl();
  Future<void> addTask({TaskModel? task});
  addTasToDb();
  void getTask();
  void delete(TaskModel task);
  void mrkTaskUpdate(int id);
  void selectDateChange(selectedDate);
}

class HomeControllerImp extends HomeController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  DateTime dateTime = DateTime.now();

  String endTime = "9:30 PM";
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int selectRemind = 5;
  String selectRepeat = "None";
  int selectColor = 0;

  var taskList = <TaskModel>[].obs;

  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];
  List<String> repeateList = ["None", "Daily", "weekly", "Monthly"];

  @override
  Future<void> getDataFromUser(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2121),
    );

    if (pickedDate != null) {
      dateTime = pickedDate;
      update(); // Assuming this function updates the UI after changing dateTime
    } else {
      // print("No date selected.");
    }
  }

  @override
  Future<TimeOfDay?> showTimePickerUser(BuildContext context) async {
    return await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: int.parse(startTime.split(":")[0]),
          minute: int.parse(startTime.split(":")[1].split(" ")[0])),
      initialEntryMode: TimePickerEntryMode.input,
    );
  }

  @override
  getTimeFromUser(
      {required bool isStartTime, required BuildContext context}) async {
    try {
      var pickedTime = await showTimePickerUser(context);
      // ignore: unnecessary_null_comparison
      if (pickedTime != null) {
        // ignore: use_build_context_synchronously
        String formatedTime = pickedTime.format(context);
        if (isStartTime) {
          startTime = formatedTime;
        } else {
          endTime = formatedTime;
        }
      } else {
        Get.snackbar("Time Canceled", "Time Canceled");
      }
    } catch (e) {
      // Handle any potential errors here
    }
    update();
  }

  @override
  selectRemindFun(String? newValue) {
    selectRemind = int.parse(newValue!);
    update();
  }

  @override
  selectRepeatFun(String? newValue) {
    selectRepeat = newValue!;
    update();
  }

  @override
  selectedColor(index) {
    selectColor = index;
    update();
  }

  @override
  vailedDataFiedl() {
    if (titleController.text.isNotEmpty || noteController.text.isNotEmpty) {
      //add to dataBse
      Get.back();
    } else if (titleController.text.isEmpty || noteController.text.isEmpty) {
      Get.snackbar("Reqired", "All fields are required !",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          icon: const Icon(Icons.warning_amber_rounded));
    }
    update();
  }

  @override
  addTasToDb() async {
    await addTask(
        task: TaskModel(
      note: noteController.text,
      title: titleController.text,
      remind: selectRemind,
      endTime: endTime,
      start: startTime,
      repeat: selectRepeat,
      color: selectColor,
      isCompleted: 0,
      date: DateFormat.yMd().format(dateTime),
    ));
    update();
  }

  @override
  Future<int> addTask({TaskModel? task}) async {
    final add = await DBHelper.insert(task);
    // print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm ${add}");
    return add;
  }

//get all data from table
  @override
  void getTask() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => TaskModel.fromjson(data)).toList());
    update();
  }

  @override
  void onReady() {
    getTask();
    super.onReady();
  }

  @override
  void delete(TaskModel task) {
    DBHelper.delete(task);
    getTask();
  }

  @override
  void mrkTaskUpdate(int id) async {
    await DBHelper.update(id);
    getTask();
  }

  @override
  void selectDateChange(selectedDate) {
    dateTime = selectedDate;
    update();
  }

  @override
  void dispose() {
    noteController.dispose();
    titleController.dispose();

    super.dispose();
  }
}
