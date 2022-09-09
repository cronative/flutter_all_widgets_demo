import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:demo/constants/constant.dart';

void main() {
  runApp(MaterialApp(
    color: Colors.white30,
    home: SplashApp(),
  ));
}

class SplashApp extends StatefulWidget {
  SplashApp({Key key}) : super(key: key);

  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> {
  BuildContext staticContext;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    Timer(Duration(seconds: 2), nextScreen);
  }

  @override
  Widget build(BuildContext context) {
    staticContext = context;
    Firebase.initializeApp();
    return Scaffold(
      body: Center(child: Image.asset('assets/images/logo.png')),
    );
  }

  void nextScreen() {
    Navigator.pushReplacementNamed(staticContext, '/home');
    getToken();
  }

  getToken() async {
    String token;
    await FirebaseMessaging.instance
        .getToken()
        .then((value) => {token = value, print(token)});

    await receivedFirebaseNotofications();
  }
}
