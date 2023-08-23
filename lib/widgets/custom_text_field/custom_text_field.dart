import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/core/constant/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteapp/controller/home_controller/home_controller.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class CustomInputField extends StatelessWidget {
  final String text;
  final String hit;
  final Function()? onTap;
  final TextEditingController? controller;
  final Widget? widget;

   CustomInputField({
    Key? key,
    required this.text,
    required this.hit,
    this.onTap,
    this.controller,
    this.widget,
  }) : super(key: key);
  // ignore: unused_field
  final HomeControllerImp _homeControllerImp = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: titleTextStyle,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0).r,
            padding: const EdgeInsets.only(left: 5 , right: 5).w,
            height: 40.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  readOnly: widget == null ? false : true,
                  controller: controller,
                  autofocus: false,
                  cursorColor:
                      Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                  style: subtitleText,
                  decoration: InputDecoration(
                      hintText: hit,
                      hintStyle: subtitleText,
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            // ignore: deprecated_member_use
                            color: context.theme.backgroundColor,
                            width: 0),
                      )),
                )),
                widget == null
                    ? const SizedBox()
                    : SizedBox(
                        child: widget,
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
