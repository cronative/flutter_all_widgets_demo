import 'package:demo/model/paginationmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PaginationController extends GetxController {
  List<Model> list = [];
  ScrollController controller = ScrollController();
  int listLength = 6;

  void onInit() {
    generateList();
    addItems();
    super.onInit();
  }

  addItems() async {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        for (int i = 0; i < 5; i++) {
          listLength++;
          list.add(Model(name: (listLength).toString()));
          update();
        }
      }
    });
  }

  generateList() {
    list = List.generate(
        listLength, (index) => Model(name: (index + 1).toString()));
  }
}
