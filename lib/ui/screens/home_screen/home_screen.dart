import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/constant/routes.dart';
import 'package:flutter_application_1/logic/getx/controller/view_controller/view_controller.dart';
import 'package:flutter_application_1/ui/screens/home_screen/widgets/bottom_menu/bottom_menu.dart';
import 'package:flutter_application_1/ui/screens/home_screen/widgets/bottom_menu/open_bottom_menu_button.dart';
import 'package:flutter_application_1/ui/screens/search_screen/search_screen.dart';
import 'package:get/get.dart';

import 'widgets/drawer_menu/home_drawer.dart';
import 'widgets/note_list_view.dart';
import 'widgets/note_grid_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('UseNotes'),
        actions: [
          // IconButton(
          //     icon: Icon(Icons.search),
          //     onPressed: () =>
          //         showSearch(context: context, delegate: NoteSearch())),
          Obx(
            () => IconButton(
                color: Colors.white,
                icon: Icon(ViewController.to.isListView == true
                    ? Icons.view_list
                    : Icons.grid_view),
                onPressed: () => ViewController.to.toggleView()),
          ),
        ],
      ),

      // drawer: HomeDrawer(),
      body: Stack(
        children: [
          Obx(() => ViewController.to.isListView == true
              ? NoteListView()
              : NoteGridView()),
          // Positioned(
          //   bottom: 0,
          //   left: 15,
          //   right: 15,
          //   child: Container(
          //     decoration: BoxDecoration(
          //         boxShadow: [
          //           BoxShadow(
          //               color: Colors.black,
          //               offset: Offset(0, -5),
          //               blurRadius: 8.0)
          //         ],
          //         color: Colors.white,
          //         borderRadius: BorderRadius.all(Radius.circular(15))),
          //     child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           IconButton(
          //               icon: Icon(Icons.add),
          //               onPressed: () => Get.toNamed(Routes.addNote)),
          //           OpenBottomMenuButton(),
          //           IconButton(
          //               icon: Icon(Icons.search),
          //               onPressed: () => showSearch(
          //                   context: context, delegate: NoteSearch()))
          //         ]),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => Get.toNamed(Routes.addNote)),
          OpenBottomMenuButton(),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () =>
                  showSearch(context: context, delegate: NoteSearch()))
        ]),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: _addNoteFAB(),
    );
  }

  FloatingActionButton _addNoteFAB() {
    return FloatingActionButton(
      onPressed: () => Get.toNamed(Routes.addNote),
      child: Icon(
        Icons.add,
        size: 30,
      ),
    );
  }
}
