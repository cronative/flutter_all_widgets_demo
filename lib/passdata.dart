import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PassData(),
  ));
}

// ignore: must_be_immutable
class PassData extends StatelessWidget {
  PassData({Key key}) : super(key: key);
  Map data = {};
  @override
  Widget build(BuildContext context) {
    // Get previous page data
    data = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Home'),
            centerTitle: true,
            backgroundColor: Colors.red[400]),
        body: new Center(
          child: Text(
              "Name:- ${data['name']} \nEmail:- ${data['email']} \Address:- ${data['address']}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
