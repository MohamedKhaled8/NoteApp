import 'package:get/get.dart';
import 'package:noteapp/controller/home_controller/home_controller.dart';


class Binding extends Bindings {
  @override
  void dependencies() {
  //  Get.lazyPut(() => NotifyControllerImp());
   Get.lazyPut(() => HomeControllerImp());
  }

}