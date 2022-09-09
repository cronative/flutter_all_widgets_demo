import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:demo/constants/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConnectivityService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  // ignore: close_sinks
  StreamController<bool> connectionStatusController = StreamController<bool>();
  ConnectivityService() {
    // Subscribe to the connectivity Chanaged Steam
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Use Connectivity() here to gather more info if you need t
      isConnected = result == ConnectivityResult.none ? false : true;
      String message =
          isConnected == true ? "You are online" : "You are offline";
      showToast(
          message, 'LENGTH_LONG', 'TOP', Colors.black, Colors.white, 16.0);
      // connectionStatusController.add(_getStatusFromResult(result));
    });
  }

  // Convert from the third part enum to our own enum
  /*ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        isConnected = true;
        print(isConnected);
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        print(isConnected);
        isConnected = true;
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        print(isConnected);
        isConnected = false;
        return ConnectivityStatus.Offline;
      default:
        print(isConnected);
        isConnected = false;
        return ConnectivityStatus.Offline;
    }
  }*/
}
