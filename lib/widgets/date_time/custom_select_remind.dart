import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/core/constant/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteapp/controller/home_controller/home_controller.dart';
import 'package:noteapp/widgets/custom_text_field/custom_text_field.dart';

class SelectRemind extends StatelessWidget {
  SelectRemind({
    super.key,
  });

  final HomeControllerImp _homeControllerImp = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      hit: "${_homeControllerImp.selectRemind} minutes early",
      text: 'Remind',
      controller: null,
      widget: DropdownButton(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey,
          ),
          iconSize: 25.h,
          elevation: 4,
          style: subtitleText,
          underline: const SizedBox(
            height: 0,
          ),
          items: _homeControllerImp.remindList
              .map<DropdownMenuItem<String>>((int value) {
            return DropdownMenuItem<String>(
              value: value.toString(),
              child: Text(value.toString()),
            );
          }).toList(),
          onChanged: (String? newValue) {
            _homeControllerImp.selectRemindFun(newValue);
          }),
    );
  }
}
