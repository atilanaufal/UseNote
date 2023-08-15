import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/getx/controller/note_controller/note_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'note_grid_tile.dart';

class NoteGridView extends GetView<NoteController> {
  const NoteGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: controller.noteItems.length,
        itemBuilder: (context, index) {
          var noteItem = controller.noteItems[index];
          return NoteGridTile(
            noteItem: noteItem,
          );
        },
      ),
      // StaggeredGridView.builder(
      //   gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2),
      //   itemCount: controller.noteItems.length,
      //   itemBuilder: (context, index) {
      //     var noteItem = controller.noteItems[index];
      //     return NoteGridTile(
      //       noteItem: noteItem,
      //     );
      //   },
      // )
    );
  }
}
