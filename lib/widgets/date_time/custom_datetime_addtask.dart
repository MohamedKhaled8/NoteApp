import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/core/constant/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteapp/controller/home_controller/home_controller.dart';
import 'package:noteapp/view/home_screen/addtask_view/addtask_screen.dart';
import 'package:noteapp/widgets/custom_buttom_local/custom_buttom_local.dart';

class DateTimeAndAddTask extends StatelessWidget {
  DateTimeAndAddTask({
    super.key,
  });
  final HomeControllerImp _homeControllerImp = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, right: 20, left: 20).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHedlineStyle,
              ),
              Text(
                "Today",
                style: hedlineStyle,
              ),
            ],
          ),
          GetBuilder<HomeControllerImp>(builder: (_) {
            return CustomButtomLocal(
              text: "+ Add Task",
              fontSize: 14.sp,
              onTap: () async {
                await Get.to(() => AddTaskScreen());
                _homeControllerImp.getTask();
              },
            );
          })
        ],
      ),
    );
  }
}
