import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteapp/controller/home_controller/home_controller.dart';
import 'package:noteapp/widgets/custom_text_field/custom_text_field.dart';

class SAndETime extends StatelessWidget {
   SAndETime({
    super.key,
   
  });

  final HomeControllerImp _homeControllerImp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomInputField(
          text: "Start Date",
          hit: _homeControllerImp.startTime,
          widget: IconButton(
              onPressed: () {
                _homeControllerImp.getTimeFromUser(
                    isStartTime: true, context: context);
              },
              icon: const Icon(
                Icons.access_time_rounded,
                color: Colors.grey,
              )),
        )),
        SizedBox(
          width: 15.w,
        ),
        Expanded(
            child: CustomInputField(
          text: "End Date",
          hit: _homeControllerImp.endTime,
          widget: IconButton(
              onPressed: () {
                _homeControllerImp.getTimeFromUser(
                    isStartTime: false, context: context);
              },
              icon: const Icon(
                Icons.access_time_rounded,
                color: Colors.grey,
              )),
        )),
      ],
    );
  }
}
