import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

void main() {
  runApp(MaterialApp(
    home: DeviceInfo(),
  ));
}

class DeviceInfo extends StatefulWidget {
  DeviceInfo({Key key}) : super(key: key);

  @override
  _DeviceInfoState createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  String deviceName = '';
  String deviceVersion = '';
  String identifier = '';
  String sdkInt = '';

  String appName = '';
  String pakageName = '';
  String version = '';
  String buildVersion = '';

  Future<void> _deviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        setState(() {
          deviceName = build.model;
          deviceVersion = build.version.toString();
          identifier = build.androidId;
          sdkInt = build.version.sdkInt.toString();
          appName = packageInfo.appName;
          pakageName = packageInfo.packageName;
          version = packageInfo.version;
          buildVersion = packageInfo.buildNumber;
        });
        //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        setState(() {
          deviceName = data.name;
          deviceVersion = data.systemVersion;
          identifier = data.identifierForVendor;
          appName = packageInfo.appName;
          pakageName = packageInfo.packageName;
          version = packageInfo.version;
          buildVersion = packageInfo.buildNumber;
        }); //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          title: Text("Device Details"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _deviceDetails();
                },
                child: Text(
                  "Device Info",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              deviceVersion.isNotEmpty &&
                      deviceName.isNotEmpty &&
                      identifier.isNotEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text("Device Name:- " + deviceName,
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Device Version:- " + deviceVersion,
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Device Identifier:- " + identifier,
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Device SDK:- " + sdkInt,
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("App Name:- " + appName,
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("App Package :- " + pakageName,
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("App Version:- " + version,
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("App Build Version:- " + buildVersion,
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
