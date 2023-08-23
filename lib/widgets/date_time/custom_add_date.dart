import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:noteapp/controller/home_controller/home_controller.dart';

class CustomAddDate extends StatelessWidget {
  CustomAddDate({
    super.key,
  });

  final HomeControllerImp _homeControllerImp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20).w,
      child: DatePicker(
        DateTime.now(),
        height: 90.h,
        width: 80.w,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryColor,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 20.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w600)),
        dayTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w600)),
        monthTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w600)),
        onDateChange: (selectedDate) {
          _homeControllerImp.selectDateChange(selectedDate);
        },
      ),
    );
  }
}
