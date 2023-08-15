import 'package:flutter_application_1/config/constant/routes.dart';
import 'package:flutter_application_1/logic/getx/binding/home_binding/home_binding.dart';
import 'package:flutter_application_1/ui/screens/add_note_screen/add_note_screen.dart';
import 'package:flutter_application_1/ui/screens/edit_note_screen/edit_note_screen.dart';
import 'package:flutter_application_1/ui/screens/home_screen/home_screen.dart';
import 'package:flutter_application_1/ui/screens/settings_screen/settings_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: Routes.addNote,
        page: () => AddNoteScreen(),
        transition: Transition.size),
    GetPage(
        name: Routes.editNote,
        page: () => EditNoteScreen(),
        transition: Transition.leftToRight),
    GetPage(
        name: Routes.settings,
        page: () => SettingsScreen(),
        transition: Transition.leftToRight)
  ];
}
