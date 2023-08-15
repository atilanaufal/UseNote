import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ViewController extends GetxController {
  final _isListView = true.obs;

  final _listOrGrid = Hive.box<bool>('is_list_view');

  bool get isListView => _isListView.value;
  static ViewController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    _isListView(_listOrGrid.get('l/g'));
  }

  void toggleView() {
    _isListView(!_isListView.value);
    _listOrGrid.put('l/g', _isListView.value);
  }
}
