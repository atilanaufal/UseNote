import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/screens/home_screen/widgets/bottom_menu/bottom_menu_item/bottom_menu_item.dart';
import 'package:get/get.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        // width: MediaQuery.of(context).size.width / 1.05,
        // height: MediaQuery.of(context).size.height / 1.1,
        decoration: BoxDecoration(
            // color: Colors.white,
            color: Colors.white.withOpacity(0.8),
            // color: Colors.grey.shade50.withOpacity(0.8),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            //  Container(
            //         //  color: Colors.red,
            //         alignment: Alignment.centerLeft,
            //         padding: EdgeInsets.all(10),
            //         height: 65,
            //         width: 25,
            //         decoration: BoxDecoration(
            //           border: Border(
            //               bottom: BorderSide(width: 1, color: Colors.grey)),
            //           // color: Colors.white.withOpacity(0.8),
            //           // color: Colors.white30
            //         ),
            //         child: ListTile(
            //           leading: CircleAvatar(
            //             backgroundColor: Colors.grey[350],
            //             child: Text("C"),
            //           ),
            //           title: Text("CorSS-REST"),
            //         )),
            SizedBox(
              height: 25,
            ),
            GridView.count(
              crossAxisCount: 4,
              children: [
                BottomMenuItem(
                  icon: Icons.book,
                  title: "NoteBooks",
                  onPressed: () {},
                ),
                BottomMenuItem(
                  icon: Icons.note,
                  title: "Notes",
                  onPressed: () {},
                ),
                BottomMenuItem(
                  icon: Icons.delete,
                  title: "Trash Can",
                  onPressed: () {},
                ),
                BottomMenuItem(
                  icon: Icons.settings,
                  title: "Settings",
                  onPressed: () {},
                ),
                BottomMenuItem(
                  icon: Icons.settings,
                  title: "Settings",
                  onPressed: () {},
                ),
                BottomMenuItem(
                  icon: Icons.settings,
                  title: "Settings",
                  onPressed: () {},
                ),
              ],
            ),
            Container(
              // alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Colors.grey)),
                // color: Colors.white30
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.power_settings_new),
                      label: Text("Log-Out")),
                  IconButton(
                      icon: Icon(Icons.widgets_outlined),
                      onPressed: () => Get.back()),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // DraggableScrollableSheet(
    //     initialChildSize: 0.95,
    //     minChildSize: 0.9,
    //     maxChildSize: 0.95,
    //     builder: (_, controller) {
    //       return Container(
    //         height: 50.0,
    //         decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.all(Radius.circular(15))),
    //         padding: EdgeInsets.symmetric(horizontal: 15),
    //         child: Stack(
    //           alignment: AlignmentDirectional.bottomCenter,
    //           children: [
    //             ListView(
    //               controller: controller,
    //               children: [
    //                 Icon(
    //                   Icons.minimize_rounded,
    //                 ),
    //                 Text('dadad'),
    //               ],
    //             ),
    //             IconButton(
    //               icon: Icon(
    //                 Icons.minimize_rounded,
    //               ),
    //               onPressed: () {},
    //             )
    //           ],
    //         ),
    //       );
    //     });
  }
}
