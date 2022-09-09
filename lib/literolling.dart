import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

void main() {
  runApp(MaterialApp(home: LiteRolling()));
}

class LiteRolling extends StatelessWidget {
  const LiteRolling({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lite Rolling'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Do you like Flutter?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: LiteRollingSwitch(
                  value: true,
                  textOn: 'Yes',
                  textOff: 'No',
                  colorOn: Colors.green,
                  colorOff: Colors.red[400],
                  iconOn: Icons.check,
                  iconOff: Icons.close,
                  animationDuration: Duration(milliseconds: 500),
                  onChanged: (bool state) {
                    print('turned ${(state) ? 'yes' : 'no'}');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
