import 'package:flutter/material.dart';
import 'package:noteapp/core/constant/theme_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first


// ignore: must_be_immutable
class CustomButtomLocal extends StatelessWidget {
  final String text;
  final Function()? onTap;
 double? fontSize;
   CustomButtomLocal({
    Key? key,
    required this.text,
    this.onTap,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 42.h,
        width: 150.w,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(18)),
        child: Center(
          child: Text(
            text,
            style:  TextStyle(color: Colors.white , fontSize: fontSize ),
          ),
        ),
      ),
    );
  }
}
