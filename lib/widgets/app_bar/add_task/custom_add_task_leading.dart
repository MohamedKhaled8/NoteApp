import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomAddTaskLeadingAppBar extends StatelessWidget {
  CustomAddTaskLeadingAppBar({
    super.key,
    this.icon,

  });


  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Icon(
        icon,
        color: Get.isDarkMode ? Colors.white : Colors.black,
        weight: 20.w,
      ),
    );
  }
}
