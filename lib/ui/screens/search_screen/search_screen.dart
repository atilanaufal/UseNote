import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/constant/routes.dart';
import 'package:flutter_application_1/logic/getx/controller/note_controller/note_controller.dart';

import 'package:get/get.dart';

class NoteSearch extends SearchDelegate<String> {
  NoteController controller = Get.find<NoteController>();
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back), onPressed: () => close(context, ""));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestions = controller.noteItems.where((note) {
      var titleLower = note.title!.toLowerCase();
      var contentLower = note.content!.toLowerCase();
      var queryLower = query.toLowerCase();

      return titleLower.contains(queryLower) ||
          contentLower.contains(queryLower);
    }).toList();
    return query.isEmpty
        ? Container()
        : ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              var suggestion = suggestions[index];
              return ListTile(
                leading: Icon(Icons.timelapse),
                title: Text(suggestion.title!),
                subtitle: Text(suggestion.content!),
                onTap: () {
                  query = suggestion.title!;
                  Get.toNamed(Routes.editNote, arguments: {
                    "id": suggestion.id,
                    "title": suggestion.title,
                    "content": suggestion.content,
                  });
                },
              );
            },
          );
  }
}
