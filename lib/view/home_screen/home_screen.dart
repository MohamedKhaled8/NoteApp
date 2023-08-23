import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/widgets/bottom_sheet.dart';
import 'package:noteapp/core/model/task_model.dart';
import 'package:noteapp/core/constant/theme_color.dart';
import 'package:noteapp/widgets/task_title/task_title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/app_bar/home/custom_actions_appbar.dart';
import 'package:noteapp/widgets/date_time/custom_add_date.dart';
import 'package:noteapp/widgets/date_time/custom_datetime_addtask.dart';
import 'package:noteapp/widgets/app_bar/home/custom_laeding_abbbar.dart';
import 'package:noteapp/controller/home_controller/home_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
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
        leading: CustomLeadingAppBar(
          icon: Get.isDarkMode
              ? Icons.wb_sunny_outlined
              : Icons.nightlight_outlined,
        ),
        actions: [
          CustomActionsAppBar(
            icon: Get.isDarkMode ? Icons.person : Icons.person_2_outlined,
          ),
        ],
      ),
      body: Column(
        children: [
          DateTimeAndAddTask(),
          GetBuilder<HomeControllerImp>(builder: (_) {
            return CustomAddDate();
          }),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                  itemBuilder: (_, index) {
                    TaskModel task = _homeControllerImp.taskList[index];
                    if (task.repeat == 'Daily') {
                      // DateTime date =
                      //     DateFormat.jm().parse(task.start.toString());
                      // var myTime = DateFormat("HH:mm").format(date);
                      return AnimationConfiguration.staggeredList(
                          position: index,
                          child: SlideAnimation(
                              child: FadeInAnimation(
                                  child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  _showButtomSheet(context, task);
                                },
                                child: TaskTile(task),
                              ),
                            ],
                          ))));
                    }
                    if (task.date ==
                        DateFormat.yMd().format(_homeControllerImp.dateTime)) {
                      return AnimationConfiguration.staggeredList(
                          position: index,
                          child: SlideAnimation(
                              child: FadeInAnimation(
                                  child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  _showButtomSheet(context, task);
                                },
                                child: TaskTile(task),
                              ),
                            ],
                          ))));
                    } else {
                      return const SizedBox();
                    }
                  },
                  itemCount: _homeControllerImp.taskList.length);
            }),
          ),
        ],
      ),
    );
  }
}

_showButtomSheet(BuildContext context, TaskModel task) {
  // ignore: no_leading_underscores_for_local_identifiers
  final HomeControllerImp _homeControllerImp = Get.find();
  Get.bottomSheet(Container(
    padding: const EdgeInsets.only(top: 4).r,
    height: task.isCompleted == 1
        ? MediaQuery.of(context).size.height * 0.35
        : MediaQuery.of(context).size.height * 0.35,
    color: Get.isDarkMode ? darkGreyColor : Colors.white,
    child: Column(
      children: [
        Container(
          height: 6.h,
          width: 120.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300]),
        ),
        const Spacer(),
        // ignore: unrelated_type_equality_checks
        task == 1
            ? const SizedBox()
            : BottoSheetButtom(
                lable: "Task Complete",
                clr: primaryColor,
                onTap: () {
                  _homeControllerImp.mrkTaskUpdate(task.id!);
                  Get.back();
                },
                isClose: false,
              ),
        SizedBox(
          height: 10.h,
        ),
        BottoSheetButtom(
          lable: "Delete Task",
          clr: Colors.red[300]!,
          onTap: () {
            _homeControllerImp.delete(task);
            _homeControllerImp.getTask();
            Get.back();
          },
          isClose: false,
        ),
        SizedBox(
          height: 10.h,
        ),
        BottoSheetButtom(
          lable: "Colse",
          clr: Colors.white,
          isClose: true,
          onTap: () {
            Get.back();
          },
        ),
      ],
    ),
  ));
}
