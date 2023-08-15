import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/constant/routes.dart';
import 'package:flutter_application_1/logic/getx/controller/note_controller/note_controller.dart';
import 'package:flutter_application_1/services/model/note_model.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';

class NoteListTile extends GetView<NoteController> {
  const NoteListTile({
    Key? key,
    @required this.noteItem,
  }) : super(key: key);

  final Note? noteItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        tileColor: Colors.amber,
        title: Text(noteItem!.title!),
        subtitle: Text(noteItem!.content!),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            controller.deleteNote(noteItem!.id);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Note Deleted ")));
          },
        ),
        onTap: () {
          Get.toNamed(Routes.editNote, arguments: {
            "id": noteItem!.id,
            "title": noteItem!.title,
            "content": noteItem!.content
          });
        },
      ),
    );
  }
}
