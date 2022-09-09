import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MaterialApp(home: ChangeTheme()));
}

class ChangeTheme extends StatefulWidget {
  ChangeTheme({Key key}) : super(key: key);

  @override
  _ChangeThemeState createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  ThemeMode _themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Change Theme'), centerTitle: true),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Select Theme Mode',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
            RadioListTile(
              title: Text('system'),
              value: ThemeMode.system,
              groupValue: _themeMode,
              onChanged: (value) {
                setState(() {
                  _themeMode = value;
                  Get.changeThemeMode(_themeMode); //STEP 3 - change themes
                });
              },
            ),
            RadioListTile(
              title: Text('dark'),
              value: ThemeMode.dark,
              groupValue: _themeMode,
              onChanged: (value) {
                setState(() {
                  _themeMode = value;
                  Get.changeThemeMode(_themeMode);
                });
              },
            ),
            RadioListTile(
              title: Text('light'),
              value: ThemeMode.light,
              groupValue: _themeMode,
              onChanged: (value) {
                setState(() {
                  _themeMode = value;
                  Get.changeThemeMode(_themeMode);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
