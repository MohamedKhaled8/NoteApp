import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/core/constant/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteapp/controller/home_controller/home_controller.dart';
import 'package:noteapp/widgets/custom_text_field/custom_text_field.dart';

class SelectRepeat extends StatelessWidget {
   SelectRepeat({
    super.key,

  });

   final HomeControllerImp _homeControllerImp = Get.find();

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      hit: "${_homeControllerImp.selectRepeat} ",
      text: 'Repeat',
      controller: null,
      widget: DropdownButton(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey,
          ),
          iconSize: 35.h,
          elevation: 4,
          style: subtitleText,
          underline: const SizedBox(
            height: 0,
          ),
          items: _homeControllerImp.repeateList
              .map<DropdownMenuItem<String>>((String? value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value!,
                style: const TextStyle(color: Colors.grey),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            _homeControllerImp.selectRepeatFun(newValue);
          }),
    );
  }
}

