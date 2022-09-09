import 'package:demo/alertdemo.dart';
import 'package:demo/calendar.dart';
import 'package:demo/camerademo.dart';
import 'package:demo/carousellist.dart';
import 'package:demo/changetheme.dart';
import 'package:demo/cookie_store.dart';
import 'package:demo/dashboard.dart';
import 'package:demo/deviceinfo.dart';
import 'package:demo/expansion_tile_card_demo.dart';
import 'package:demo/file_structure.dart';
// import 'package:demo/featurediscoverydemo.dart';
import 'package:demo/firebaseInsert.dart';
import 'package:demo/firebaselogin.dart';
import 'package:demo/firebaseview.dart';
import 'package:demo/googlelogin.dart';
import 'package:demo/googlemapdemo.dart';
import 'package:demo/groupedlist.dart';
import 'package:demo/home.dart';
import 'package:demo/inputfield.dart';
import 'package:demo/jsonDemo.dart';
import 'package:demo/listview.dart';
import 'package:demo/listwithselect.dart';
import 'package:demo/literolling.dart';
import 'package:demo/localnotification.dart';
import 'package:demo/newsApp.dart';
import 'package:demo/nutritionapp.dart';
import 'package:demo/paginationdemo.dart';
import 'package:demo/passdata.dart';
import 'package:demo/pinput.dart';
import 'package:demo/popupdesign.dart';
import 'package:demo/qrscan.dart';
import 'package:demo/rating.dart';
import 'package:demo/second.dart';
import 'package:demo/services/checknetwork_service.dart';
import 'package:demo/splashscreen.dart';
import 'package:demo/storyview.dart';
import 'package:demo/ui_challenge_1.dart';
import 'package:demo/widgetlifecycle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
      statusBarColor: Colors.red, // status bar color
      statusBarBrightness: Brightness.light, //status bar brigtness
      statusBarIconBrightness: Brightness.light, //status barIcon Brightness
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashApp(),
      navigatorKey: ConnectivityService().navigatorKey,
      theme: ThemeData.light().copyWith(primaryColor: Colors.red),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.red),
      themeMode: ThemeMode.system,
      routes: {
        '/home': (context) => Home(),
        '/second': (context) => Second(),
        '/story': (context) => Story(),
        '/lite-roling': (context) => LiteRolling(),
        '/rating': (context) => Rating(),
        // '/feature': (context) => FeatureDiscoveryDemo(),
        '/list': (context) => List(),
        '/group-list': (context) => GroupList(),
        '/google-login': (context) => GLogin(),
        '/pass-data': (context) => PassData(),
        '/device-info': (context) => DeviceInfo(),
        '/carouser-list': (context) => CarouserListDemo(),
        '/google-map': (context) => GoogleMapScreen(),
        '/news': (context) => NewsApp(),
        '/camera': (context) => CameraDemo(),
        '/dialog': (context) => DialogDemo(),
        '/popup-design': (context) => PopupDesign(),
        '/list-select': (context) => ListWithSelect(),
        '/scan': (context) => QRScan(),
        '/pin': (context) => PinPutTest(),
        '/input': (context) => InputDemo(),
        '/notification': (context) => LocalNotificationDemo(),
        '/jsondemo': (context) => JsonDemo(),
        '/firebase': (context) => FirebaseLogin(),
        '/firebase-insert': (context) => FirebaseInsert(),
        '/firebase-view': (context) => FirebaseView(),
        '/calendar': (context) => Calendar(),
        '/widget-lifecycle': (context) => WidgetLifeCycle(),
        '/change-theme': (context) => ChangeTheme(),
        '/pagination': (context) => PaginationDemo(),
        '/nutrition': (context) => NutritionApp(),
        '/cookie-store': (context) => CookieStore(),
        '/expansion-tile-demo': (context) => ExpansionListCard(),
        '/ui-challenge-1': (context) => UiChallenge1(),
        '/dashboard': (context) => Dashboard(),
        '/file-structure': (context) => FileStructure(),
      },
    ));
  }
}
