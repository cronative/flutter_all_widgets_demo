import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

void main() {
  runApp(MaterialApp(home: PinPutTest()));
}

class PinPutTest extends StatefulWidget {
  PinPutTest({Key key}) : super(key: key);

  @override
  _PinPutTestState createState() => _PinPutTestState();
}

class _PinPutTestState extends State<PinPutTest> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.blueGrey[900],
            appBar: AppBar(
                title: Text('Pin input'),
                centerTitle: true,
                backgroundColor: Colors.red[400]),
            body: Builder(builder: (context) {
              return Center(
                  child: SingleChildScrollView(
                      child: Column(mainAxisSize: MainAxisSize.min, children: <
                          Widget>[
                Container(
                    color: Colors.blueGrey[900],
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(20.0),
                    child: PinPut(
                        // keyboardType: TextInputType.text,
                        withCursor: true,
                        checkClipboard: true,
                        autofocus: true,
                        fieldsCount: 4,
                        onSubmit: (String pin) => _showSnackBar(pin, context),
                        focusNode: _pinPutFocusNode,
                        controller: _pinPutController,
                        submittedFieldDecoration: _pinPutDecoration.copyWith(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white),
                        selectedFieldDecoration: _pinPutDecoration,
                        followingFieldDecoration: _pinPutDecoration.copyWith(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: Colors.white.withOpacity(.5),
                            ),
                            color: Colors.white)))
              ])));
            })));
  }

  void _showSnackBar(String pin, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Colors.red[400],
    ));

    _pinPutFocusNode.unfocus();
  }
}
