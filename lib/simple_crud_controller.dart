import 'package:get/get.dart';

class SimpleCrudController extends GetxController {
  final _list = <String>[].obs;
  List<String> get list => _list;

  add(String data) {
    _list.add(data);
  }

  updateItem(int index, String data) {
    _list[index] = data;
  }

  deleteItem(int index) {
    _list.removeAt(index);
  }

  clearState() {
    Get.delete<SimpleCrudController>(force: true);
  }
}
