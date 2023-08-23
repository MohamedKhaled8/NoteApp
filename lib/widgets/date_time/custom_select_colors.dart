import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/constant/text_style.dart';
import '../../core/constant/theme_color.dart';
import 'package:noteapp/view/home_screen/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:noteapp/controller/home_controller/home_controller.dart';
import 'package:noteapp/widgets/custom_buttom_local/custom_buttom_local.dart';

class CustomSelectColors extends StatelessWidget {
  CustomSelectColors({
    super.key,
  });

  final HomeControllerImp _homeControllerImp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Color",
              style: titleTextStyle,
            ),
            SizedBox(
              height: 10.h,
            ),
            Wrap(
              children: List<Widget>.generate(3, (index) {
                return InkWell(
                  onTap: () {
                    _homeControllerImp.selectedColor(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10).w,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: index == 0
                          ? primaryColor
                          : index == 1
                              ? pinkClor
                              : yellowColor,
                      child: _homeControllerImp.selectColor == index
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 16.h,
                            )
                          : const SizedBox(),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
        CustomButtomLocal(
          text: "Create Task",
          fontSize: 14.sp,
          onTap: () async {
            _homeControllerImp.vailedDataFiedl();
            await _homeControllerImp.addTasToDb(); // استدعاء الدالة هنا
            Get.to(() => HomeScreen());
          },
        ),
      ],
    );
  }
}
