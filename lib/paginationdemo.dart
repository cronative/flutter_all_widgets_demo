import 'package:demo/model/paginationcontrol.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MaterialApp(home: PaginationDemo()));
}

class PaginationDemo extends StatefulWidget {
  PaginationDemo({Key key}) : super(key: key);

  @override
  _PaginationDemoState createState() => _PaginationDemoState();
}

class _PaginationDemoState extends State<PaginationDemo> {
  PaginationController paginationController = Get.put(PaginationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Pagination'), centerTitle: true),
        body: GetBuilder(
          init: paginationController,
          builder: (value) => ListView.builder(
            controller: value.controller,
            itemCount: value.list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.red,
                  height: 100,
                  child: Center(
                    child: Text(
                      value.list[index].name,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
