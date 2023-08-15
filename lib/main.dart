import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/getx/binding/home_binding/home_binding.dart';

import 'package:flutter_application_1/services/model/note_model.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/constant/routes.dart';
import 'config/router/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<Note>(NoteModelAdapter());
  await Hive.openBox<Note>('note_inventory');
  await Hive.openBox<bool>('is_list_view');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.fadeIn,
      title: "UseNote",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.black,
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
          ),
        ),
      ),
    );
  }
}
