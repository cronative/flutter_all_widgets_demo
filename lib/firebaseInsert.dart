import 'package:demo/constants/database.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: FirebaseInsert()));
}

class FirebaseInsert extends StatefulWidget {
  FirebaseInsert({Key key}) : super(key: key);

  @override
  _FirebaseInsertState createState() => _FirebaseInsertState();
}

class _FirebaseInsertState extends State<FirebaseInsert> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController decsController = new TextEditingController();
  Map data = {};
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      data = ModalRoute.of(context).settings.arguments;
      titleController = TextEditingController(
        text: data == null ? '' : data['title'],
      );

      decsController = TextEditingController(
        text: data == null ? '' : data['description'],
      );
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(data == null ? 'Add Record' : 'Update Record'),
            centerTitle: true,
            backgroundColor: Colors.red[400],
            actions: [
              data == null
                  ? Center()
                  : IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 22,
                      ),
                      onPressed: () async {
                        await Database.deleteItem(data['id']);

                        Navigator.of(context).pop();
                      },
                    ),
            ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    controller: titleController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                        hintText: 'Enter Title'),
                    obscureText: false,
                    style: TextStyle(color: Colors.black87, fontSize: 20),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                      autofocus: true,
                      controller: decsController,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: OutlineInputBorder(),
                          labelText: 'Address',
                          hintText: 'Enter Address'),
                      keyboardType: TextInputType.streetAddress,
                      maxLines: 5,
                      obscureText: false,
                      style: TextStyle(color: Colors.black87, fontSize: 20),
                      textInputAction: TextInputAction.newline),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () async {
                      if (data == null) {
                        await Database.addItem(
                            titleController.text, decsController.text);
                      } else {
                        await Database.updateItem(titleController.text,
                            decsController.text, data['id']);
                      }

                      Navigator.pop(context);
                    },
                    child: new Text('Submit'),
                    style: ElevatedButton.styleFrom(primary: Colors.red[400]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
