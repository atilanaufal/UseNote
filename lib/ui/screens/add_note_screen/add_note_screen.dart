import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/getx/controller/note_controller/note_controller.dart';
import 'package:flutter_application_1/ui/screens/edit_note_screen/tools_button.dart';
import 'package:get/get.dart';

class AddNoteScreen extends GetView<NoteController> {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: () {
        //       controller.titleFieldController.value.dispose();
        //       controller.contentFieldController.value.dispose();
        //       Get.back();
        //     }),
        title: Text("Add Note"),
        actions: [
          TextButton(
              onPressed: () {
                controller.addNote();
              },
              child: Text("Save"))
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
              child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: context.height -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                  child: TextField(
                      style: TextStyle(fontSize: 25),
                      controller: controller.titleFieldController.value,
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
                        controller: controller.contentFieldController.value,
                        maxLines: null,
                        expands: false,
                        minLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Content",
                        )),
                  ),
                ),
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
      ),
      // bottomNavigationBar: ToolsButton(),
      // resizeToAvoidBottomInset: true,
    );
  }
}
