import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: DialogDemo()));
}

class DialogDemo extends StatefulWidget {
  @override
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Awesome Dialog'),
          backgroundColor: Colors.red[400],
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  AnimatedButton(
                      text: 'Info Dialog',
                      pressEvent: () {
                        infoDialog(context);
                      }),
                  SizedBox(
                    height: 16,
                  ),
                  AnimatedButton(
                    text: 'Warning Dialog',
                    color: Colors.orange,
                    pressEvent: () {
                      warningDialog(context);
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  AnimatedButton(
                    text: 'Error Dialog',
                    color: Colors.red,
                    pressEvent: () {
                      errorDialog(context);
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  AnimatedButton(
                    text: 'Succes Dialog',
                    color: Colors.green,
                    pressEvent: () {
                      succesDialog(context);
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  AnimatedButton(
                    text: 'No Header Dialog',
                    color: Colors.cyan,
                    pressEvent: () {
                      noHeaderDialog(context);
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  AnimatedButton(
                    text: 'Custom Body Dialog',
                    color: Colors.blueGrey,
                    pressEvent: () {
                      customBodyDialog(context);
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  AnimatedButton(
                    text: 'Auto Hide Dialog',
                    color: Colors.purple,
                    pressEvent: () {
                      autoHideDialog(context);
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  AnimatedButton(
                    text: 'Body with Input',
                    color: Colors.blueGrey,
                    pressEvent: () {
                      showBodyWithInput(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showBodyWithInput(context) {
    AwesomeDialog dialog;
    dialog = AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      keyboardAware: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              'Form Data',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              elevation: 0,
              color: Colors.blueGrey.withAlpha(40),
              child: TextFormField(
                autofocus: true,
                minLines: 1,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Title',
                  prefixIcon: Icon(Icons.text_fields),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Material(
              elevation: 0,
              color: Colors.blueGrey.withAlpha(40),
              child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.multiline,
                maxLengthEnforced: true,
                minLines: 2,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Description',
                  prefixIcon: Icon(Icons.text_fields),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AnimatedButton(
                text: 'Close',
                pressEvent: () {
                  dialog.dismiss();
                })
          ],
        ),
      ),
    )..show();
  }

  autoHideDialog(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      animType: AnimType.SCALE,
      title: 'Auto Hide Dialog',
      desc: 'AutoHide after 3 seconds',
      autoHide: Duration(seconds: 3),
    )..show();
  }

  customBodyDialog(context) {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      headerAnimationLoop: false,
      body: Center(
        child: Text(
          'If the body is specified, then title and description will be ignored, this allows to further customize the dialogue.',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      title: 'This is Ignored',
      desc: 'This is also Ignored',
    )..show();
  }

  noHeaderDialog(context) {
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      dialogType: DialogType.NO_HEADER,
      title: 'No Header',
      desc: 'Dialog description here',
      btnOkOnPress: () {
        debugPrint('btnOkOnPress');
      },
      btnCancelOnPress: () {
        debugPrint('btnCancelOnPress');
      },
      btnCancelIcon: Icons.close,
      btnOkIcon: Icons.check_circle,
    )..show();
  }

  succesDialog(context) {
    AwesomeDialog(
      context: context,
      animType: AnimType.LEFTSLIDE,
      headerAnimationLoop: false,
      dialogType: DialogType.SUCCES,
      title: 'Succes',
      desc: 'Dialog description here',
      btnOkOnPress: () {
        debugPrint('OnClcik');
      },
      btnOkIcon: Icons.check_circle,
    )..show();
  }

  errorDialog(context) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        headerAnimationLoop: false,
        title: 'Error',
        desc: 'Dialog description here',
        btnOkOnPress: () {},
        btnOkIcon: Icons.cancel,
        btnOkColor: Colors.red)
      ..show();
  }

  warningDialog(context) {
    AwesomeDialog(
        context: context,
        dialogType: DialogType.WARNING,
        headerAnimationLoop: false,
        animType: AnimType.TOPSLIDE,
        showCloseIcon: true,
        closeIcon: Icon(Icons.close_fullscreen_outlined),
        title: 'Warning',
        desc: 'Dialog description here',
        btnCancelOnPress: () {},
        btnOkOnPress: () {})
      ..show();
  }

  infoDialog(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      borderSide: BorderSide(color: Colors.red, width: 2),
      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.TOPSLIDE,
      title: 'INFO',
      desc: 'Dialog description here...',
      showCloseIcon: true,
      btnCancelOnPress: () {
        print('btnCancelOnPress');
      },
      btnOkOnPress: () {
        print('btnOkOnPress');
      },
    )..show();
  }
}
