import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/core/constant/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteapp/widgets/date_time/custom_s_and_time.dart';
import '../../../controller/home_controller/home_controller.dart';
import 'package:noteapp/widgets/date_time/custom_select_colors.dart';
import 'package:noteapp/widgets/date_time/custom_select_remind.dart';
import 'package:noteapp/widgets/date_time/custom_select_repeat.dart';
import 'package:noteapp/widgets/custom_text_field/custom_text_field.dart';
import 'package:noteapp/widgets/app_bar/add_task/custom_add_task_leading.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  // ignore: unused_field
  final HomeControllerImp _homeControllerImp = Get.put(HomeControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: deprecated_member_use
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        // ignore: deprecated_member_use
        backgroundColor: context.theme.backgroundColor,
        elevation: 0,
        leading: CustomAddTaskLeadingAppBar(icon: Icons.arrow_back_ios_new , ),
        // actions: [
        //   CustomAddTaskActionsAppBar(
        //     icon: Get.isDarkMode ? Icons.person : Icons.person_2_outlined,
        //   ),
        // ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5).r,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Task",
                style: hedlineStyle,
              ),
              GetBuilder<HomeControllerImp>(builder: (_) {
                return CustomInputField(
                  hit: 'Enter your title',
                  text: 'Title',
                  controller: _homeControllerImp.titleController,
                );
              }),
              GetBuilder<HomeControllerImp>(builder: (_) {
                return CustomInputField(
                  hit: 'Enter your Note',
                  text: 'Note',
                  controller: _homeControllerImp.noteController,
                );
              }),
              GetBuilder<HomeControllerImp>(builder: (_) {
                return CustomInputField(
                  hit: DateFormat.yMd().format(_homeControllerImp.dateTime),
                  text: 'Date',
                  controller: null,
                  widget: InkWell(
                    onTap: () async {
                      await _homeControllerImp.getDataFromUser(context);
                    },
                    child: const Icon(
                      Icons.calendar_month_sharp,
                      color: Colors.grey,
                    ),
                  ),
                );
              }),
              GetBuilder<HomeControllerImp>(builder: (_) {
                return SAndETime();
              }),
              GetBuilder<HomeControllerImp>(builder: (_) {
                return SelectRemind();
              }),
              GetBuilder<HomeControllerImp>(builder: (_) {
                return SelectRepeat();
              }),
              SizedBox(
                height: 10.h,
              ),
              GetBuilder<HomeControllerImp>(builder: (_) {
                return CustomSelectColors();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
