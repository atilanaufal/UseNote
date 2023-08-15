import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/getx/controller/note_controller/note_controller.dart';
import 'package:get/get.dart';

import 'note_list_tile.dart';

class NoteListView extends GetView<NoteController> {
  const NoteListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: controller.noteItems.length,
        itemBuilder: (context, index) {
          var noteItem = controller.noteItems[index];
          return NoteListTile(noteItem: noteItem);
        }));
  }
}
