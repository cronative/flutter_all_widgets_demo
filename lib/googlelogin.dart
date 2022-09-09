import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MaterialApp(home: GLogin()));
}

// ignore: must_be_immutable
class GLogin extends StatelessWidget {
  GLogin({Key key}) : super(key: key);
  final googleSign = GoogleSignIn(scopes: ['email']);
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red[400], title: Text('Google Login')),
        body: Container(
          child: Center(
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.red[400],
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                isLogin == false ? 'Google Login' : 'Logout',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              onPressed: _showRatingAppDialog,
            ),
          ),
        ),
      ),
    );
  }

  _showRatingAppDialog() async {
    if (isLogin) {
      logout();
      return;
    }
    final user = await googleSign.signIn();
    if (user != null) {
      print(user.displayName);
      print(user.photoUrl);
      print(user.email);
      print(user.id);
      isLogin = true;
    }
  }

  logout() async {
    await googleSign.signOut();
    isLogin = false;
  }
}
