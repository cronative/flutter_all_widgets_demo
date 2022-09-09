import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:demo/constants/database.dart';

void main() {
  runApp(MaterialApp(home: FirebaseLogin()));
}

class FirebaseLogin extends StatefulWidget {
  FirebaseLogin({Key key}) : super(key: key);

  @override
  _FirebaseLoginState createState() => _FirebaseLoginState();
}

class _FirebaseLoginState extends State<FirebaseLogin> {
  final FocusNode _uidFocusNode = FocusNode();
  TextEditingController firstNameController = new TextEditingController();
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Login With Firebase'),
            backgroundColor: Colors.red[400],
            centerTitle: true),
        body: Center(
          child: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error initializing Firebase');
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        TextFormField(
                          autofocus: true,
                          controller: firstNameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Id',
                              hintText: 'Enter User Id'),
                          obscureText: false,
                          style: TextStyle(color: Colors.black87, fontSize: 20),
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            Database.userUid = firstNameController.text;
                            Navigator.pushNamed(context, '/firebase-view');
                          },
                          child: new Text('Submit'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red[400]),
                        )
                      ],
                    ),
                  ),
                );
              }
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.red[400]),
              );
            },
          ),
        ),
      ),
    );
  }
}
