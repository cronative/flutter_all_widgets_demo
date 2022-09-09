import 'package:demo/model/users.dart';
import 'package:demo/services/api_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: JsonDemo()));
}

class JsonDemo extends StatefulWidget {
  JsonDemo({Key key}) : super(key: key);

  @override
  _JsonDemoState createState() => _JsonDemoState();
}

class _JsonDemoState extends State<JsonDemo> {
  List<User> _users;
  bool loading = false;
  @override
  void initState() {
    super.initState();
    loading = true;
    ApiService.getUsers().then((value) {
      setState(() {
        _users = value;
        loading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
        _users = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(loading ? 'Loading' : 'Users'),
            backgroundColor: Colors.red[400],
            centerTitle: true),
        body: Container(
          child: ListView.builder(
            itemCount: _users == null ? 0 : _users.length,
            itemBuilder: (context, index) {
              User user = _users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
                onTap: () {
                  print(user.toJson());
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
