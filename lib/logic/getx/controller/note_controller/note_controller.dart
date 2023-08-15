import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/config/constant/routes.dart';
import 'package:flutter_application_1/services/model/note_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class NoteController extends GetxController {
  RxList<Note> _noteItems = <Note>[].obs;
  Rx<TextEditingController> titleFieldController = TextEditingController().obs;
  Rx<TextEditingController> contentFieldController =
      TextEditingController().obs;

  final _noteItem = Note().obs;
  final _noteInventory = Hive.box<Note>('note_inventory');

  List<Note> get noteItems => _noteItems;
  static NoteController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    getNote();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    titleFieldController.value.dispose();
    contentFieldController.value.dispose();
  }

  void getNote() {
    _noteItems.value = _noteInventory.values.toList();
    // _noteInventory.values.map((e) => _noteItems.add(e)).toList();
  }

  void addNote() {
    String id = Uuid().v4();
    var titleC = titleFieldController.value;
    var contentC = contentFieldController.value;
    if (titleC.text.isNotEmpty || contentC.text.isNotEmpty) {
      _noteItem(Note(id: id, title: titleC.text, content: contentC.text));
      _noteInventory.put(_noteItem.value.id, _noteItem.value);
      titleC.clear();
      contentC.clear();
      Get.offAllNamed(Routes.home);
    } else
      return;

    getNote();
  }

  void editNote(String? id, {String? title, String? content}) {
    _noteItem(Note().copyWith(id: id, title: title, content: content));
    _noteInventory.put(id, _noteItem.value);

    getNote();
    Get.offAllNamed(Routes.home);
  }

  void deleteNote(String? id) {
    _noteInventory.delete(id);
    getNote();
  }
}
