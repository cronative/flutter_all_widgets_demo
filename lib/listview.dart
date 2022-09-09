import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  runApp(MaterialApp(
    home: List(),
  ));
}

// ignore: must_be_immutable
class List extends StatelessWidget {
  List({Key key}) : super(key: key);
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 2500));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 2500));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    final titles = [
      'bike',
      'boat',
      'bike',
      'boat',
      'bike',
      'boat',
      'bike',
      'boat',
      'bike',
      'boat',
      'bike',
      'boat'
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: AppBar(
            title: Text('List'),
            centerTitle: true,
            backgroundColor: Colors.red[400]),
        body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: false,
          header: WaterDropHeader(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              String fileName = index % 2 == 0 ? "sun.jpeg" : "moon.jpeg";
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/$fileName'),
                  ),
                  title: Text(titles[index]),
                  subtitle: Text(titles[index]),
                  onTap: (() => {
                        print(index),
                      }),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
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
