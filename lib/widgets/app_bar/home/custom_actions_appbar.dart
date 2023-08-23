import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomActionsAppBar extends StatelessWidget {
   CustomActionsAppBar({
    super.key,
    this.icon,
  });
IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10).w,
      child: Icon(
        icon,
       
        color: Get.isDarkMode ? Colors.white : Colors.black,
        weight: 20.w,
      ),
    );
  }
}
