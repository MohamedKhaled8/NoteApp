import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/core/constant/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: public_member_api_docs, sort_constructors_first

class BottoSheetButtom extends StatelessWidget {
  final String lable;
  final Color clr;
  final Function()? onTap;

  BottoSheetButtom({
    Key? key,
    required this.lable,
    required this.clr,
    required this.onTap,
    required this.isClose,
  }) : super(key: key);
  bool isClose = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4).w,
        height: 55.h,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.w,
            color: isClose == true
                ? Get.isDarkMode
                    ? Colors.green[600]!
                    : Colors.grey[300]!
                : clr,
          ),
          color: isClose == true ? Colors.transparent : clr,
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Center(
          child: Text(lable,
              style: isClose
                  ? titleTextStyle
                  : titleTextStyle.copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}
