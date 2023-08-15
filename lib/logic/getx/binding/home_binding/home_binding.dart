import 'package:flutter_application_1/logic/getx/controller/note_controller/note_controller.dart';
import 'package:flutter_application_1/logic/getx/controller/view_controller/view_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NoteController());
    Get.put(ViewController());
  }
}
