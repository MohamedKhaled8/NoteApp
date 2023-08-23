import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteapp/core/services/themes_services.dart';
// ignore_for_file: must_be_immutable

class CustomLeadingAppBar extends StatelessWidget {
  CustomLeadingAppBar({
    super.key,
    this.icon,
    // required this.notificationService,
  });


  // var notificationService;
  IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
        ThemeServices().changeThemes();
        // // notificationService.displayNotification(
        //     title: "Theme Change",
        //     body: Get.isDarkMode
        //         ? "Activated Dark Mode"
        //         : "Activated Ligth Mode");
      },
      child: Icon(
        icon,
        color: Get.isDarkMode ? Colors.white : Colors.black,
        weight: 20.w,
      ),
    );
  }
}
