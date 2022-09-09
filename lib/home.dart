import 'dart:typed_data';

import 'package:demo/components/stats_grid.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = ScreenshotController();

  Future<bool> onBackPress(context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Do you wish to exit?'),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () => {Navigator.pop(context, false)},
                ),
                TextButton(
                    onPressed: () => {Navigator.pop(context, true)},
                    child: Text('Exit'))
              ],
            ));
  }

  Uint8List fingerImages;

  takeScreenShot() {
    final image = controller.capture();
    if (image == null) {
      return;
    }
    image.then(
      (value) => {
        setState(() {
          fingerImages = value;
        })
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final floatingButtons = List<UnicornButton>();
    floatingButtons.add(
      UnicornButton(
        hasLabel: true,
        labelText: "Attachment",
        currentButton: FloatingActionButton(
          heroTag: "attachment",
          backgroundColor: Colors.black,
          mini: true,
          child: Icon(Icons.attach_file),
          onPressed: () {
            print('Attachment FAB clicked');
          },
        ),
      ),
    );
    floatingButtons.add(
      UnicornButton(
        hasLabel: true,
        labelText: "Camera",
        currentButton: FloatingActionButton(
          onPressed: () {
            print('Camera FAB clicked');
            takeScreenShot();
          },
          heroTag: "camera",
          backgroundColor: Colors.black,
          mini: true,
          child: Icon(Icons.photo_camera),
        ),
      ),
    );
    floatingButtons.add(
      UnicornButton(
        hasLabel: true,
        labelText: "Create Note",
        currentButton: FloatingActionButton(
          onPressed: () {
            print('Note FAB clicked');
          },
          heroTag: "note",
          backgroundColor: Colors.black,
          mini: true,
          child: Icon(Icons.note_add),
        ),
      ),
    );

    return WillPopScope(
      onWillPop: () => onBackPress(context),
      child: Scaffold(
        appBar: AppBar(
            title: Text('Home'),
            centerTitle: true,
            backgroundColor: Colors.red[400]),
        body: Screenshot(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/file-structure')},
                      child: new Text(
                        'File Structure',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/dashboard')},
                      child: new Text(
                        'Dashboard',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/widget-lifecycle')},
                      child: new Text(
                        'Widget Lifecycle',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {Navigator.pushNamed(context, '/list')},
                      child: new Text(
                        'List View With Pull To Refresh',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/lite-roling')},
                      child: new Text(
                        'Lite Roling',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/group-list')},
                      child: new Text(
                        'Group List',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/second')},
                      child: new Text(
                        'Slidable List',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/rating')},
                      child: new Text(
                        'Rating',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {Navigator.pushNamed(context, '/story')},
                      child: new Text(
                        'Story View',
                      ),
                    ),
                    /*ElevatedButton(
                    onPressed: () => {Navigator.pushNamed(context, '/feature')},
                    child: new Text(
                      'Feature Discovery',
                    ),
                  ),*/
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/google-login')},
                      child: new Text(
                        'Google Login',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.pushNamed(context, '/pass-data', arguments: {
                          "id": 1,
                          "name": "Marchelle",
                          "email": "mailward0@hibu.com",
                          "address": "57 Bowman Drive",
                          "inidialName": "M"
                        })
                      },
                      child: new Text(
                        'Pass Data',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/device-info')},
                      child: new Text(
                        'Device Info',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/carouser-list')},
                      child: new Text(
                        'Carousel Slider ',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: openUser,
                      child: new Text(
                        'Launch Url ',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/google-map')},
                      child: new Text(
                        'Google Map ',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {Navigator.pushNamed(context, '/news')},
                      child: new Text(
                        'News App',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/camera')},
                      child: new Text(
                        'Upload Image',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/dialog')},
                      child: new Text(
                        'Awesome Dialogs',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/popup-design')},
                      child: new Text(
                        'Popup Design',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/list-select')},
                      child: new Text(
                        'List With Select',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {Navigator.pushNamed(context, '/scan')},
                      child: new Text(
                        'Scan Code',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {Navigator.pushNamed(context, '/pin')},
                      child: new Text(
                        'Pin Input',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {Navigator.pushNamed(context, '/input')},
                      child: new Text(
                        'Input',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/notification')},
                      child: new Text(
                        'Local Notificcation',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/jsondemo')},
                      child: new Text(
                        'JSON Demo',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/firebase')},
                      child: new Text(
                        'Firebase CRUD',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/calendar')},
                      child: new Text(
                        'Calendar',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/change-theme')},
                      child: new Text(
                        'Change Theme',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/pagination')},
                      child: new Text(
                        'Pagination',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/nutrition')},
                      child: new Text(
                        'Nutrition App',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/cookie-store')},
                      child: new Text(
                        'Cookie Store',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.pushNamed(context, '/expansion-tile-demo')
                      },
                      child: new Text(
                        'Expansion Card',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/ui-challenge-1')},
                      child: new Text(
                        'UI Profile Design',
                      ),
                    ),
                    StatsGrid(),
                  ],
                ),
              ),
            ),
            controller: controller),
        floatingActionButton: UnicornDialer(
            backgroundColor: Colors.black38,
            parentButtonBackground: Colors.red,
            orientation: UnicornOrientation.VERTICAL,
            parentButton: Icon(Icons.keyboard_arrow_up_rounded),
            childButtons: floatingButtons),
      ),
    );
  }

  openUser() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
