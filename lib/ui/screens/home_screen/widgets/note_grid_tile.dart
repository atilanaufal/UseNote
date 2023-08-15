import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/constant/routes.dart';
import 'package:flutter_application_1/logic/getx/controller/note_controller/note_controller.dart';
import 'package:flutter_application_1/services/model/note_model.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';

class NoteGridTile extends GetView<NoteController> {
  const NoteGridTile({
    Key? key,
    @required this.noteItem,
  }) : super(key: key);

  final Note? noteItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.editNote, arguments: {
        "id": noteItem!.id,
        "title": noteItem!.title,
        "content": noteItem!.content
      }),
      child: Container(
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.grey[300],
            title: Text(
              noteItem!.title!,
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.left,
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.black),
              onPressed: () async {
                controller.deleteNote(noteItem!.id);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Note Deleted ")));
                // Flushbar(
                //   title: "Note Deleted",
                //   message: 'dadad',
                //   duration: Duration(seconds: 3),
                // ).show(context);
              },
            ),
          ),
          child: GridTileBar(
            subtitle: Text(
              noteItem!.content!,
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}
