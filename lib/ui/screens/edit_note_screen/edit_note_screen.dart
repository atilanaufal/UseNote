import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/getx/controller/note_controller/note_controller.dart';
import 'package:flutter_application_1/ui/screens/edit_note_screen/tools_button.dart';
import 'package:get/get.dart';

class EditNoteScreen extends GetView<NoteController> {
  EditNoteScreen({Key? key}) : super(key: key);
  String _id = Get.arguments['id'];
  final _titleController = Get.arguments['title'];
  final _contentController = Get.arguments['content'];

  @override
  Widget build(BuildContext context) {
    final _title = controller
        .titleFieldController(TextEditingController(text: _titleController));
    final _content = controller
        .titleFieldController(TextEditingController(text: _contentController));
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
        actions: [
          TextButton(
              onPressed: () {
                controller.editNote(_id,
                    title: _title.text, content: _content.text);
              },
              child: Text("Save"))
        ],
      ),
      body: _buildNoteField(context, _title, _content),
    );
  }

  Stack _buildNoteField(BuildContext context, TextEditingController _title,
      TextEditingController _content) {
    return Stack(
      children: [
        SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: context.height -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                child: TextField(
                    style: TextStyle(fontSize: 25),
                    controller: _title,
                    maxLines: null,
                    decoration: InputDecoration(
                        hintText: "Title",
                        focusColor: Colors.grey,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45)))),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                      controller: _content,
                      maxLines: null,
                      expands: false,
                      minLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Content",
                      )),
                ),
              ),
              // ToolsButton()
            ],
          ),
        )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(icon: Icon(Icons.undo), onPressed: () {}),
                  IconButton(icon: Icon(Icons.redo), onPressed: () {})
                ],
              ),
              ToolsButton()
            ],
          ),
        )
      ],
    );
  }
}
