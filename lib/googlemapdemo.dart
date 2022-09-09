import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

void main() {
  runApp(MaterialApp(home: GoogleMapScreen()));
}

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController mapController;
  LatLng currentPostion;
  var location = Location();
  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>();

  Stream<UserLocation> get locationStream => _locationController.stream;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    getLocation();
    locationService();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Marker Demo'),
          backgroundColor: Colors.red[400],
          centerTitle: true,
          actions: <Widget>[IconButton(icon: Icon(Icons.add), onPressed: _add)],
        ),
        body: Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              polylines: Set<Polyline>.of(_mapPolylines.values),
              onMapCreated: _onMapCreated,
              markers: _createMarker(),
              initialCameraPosition: CameraPosition(
                target: currentPostion,
                zoom: 15.0,
              ),
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              myLocationButtonEnabled: true,
            ),
          ),
          _buildContainer(),
        ]),
      ),
    );
  }

  Map<PolylineId, Polyline> _mapPolylines = {};
  int _polylineIdCounter = 1;
  void _add() {
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);

    final Polyline polyline = Polyline(
      polylineId: polylineId,
      consumeTapEvents: true,
      color: Colors.blue,
      width: 5,
      points: points,
    );

    setState(() {
      _mapPolylines[polylineId] = polyline;
    });
  }

  final List<LatLng> points = <LatLng>[];

  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: MarkerId("marker_1"),
          position: currentPostion,
          infoWindow: InfoWindow(title: 'You')),
    };
  }

  locationService() {
    // Request permission to use location
    location.requestPermission().then((permissionStatus) {
      if (permissionStatus == PermissionStatus.granted) {
        // If granted listen to the onLocationChanged stream and emit over our controller
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            print(locationData.latitude);
            print(locationData.longitude);
            _locationController.add(UserLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
            ));

            setState(() {
              points.add(LatLng(locationData.latitude, locationData.longitude));
              _add();
            });
          }
        });
      }
    });
  }

  getLocation() async {
    try {
      var userLocation = await location.getLocation();
      setState(() {
        currentPostion = LatLng(
          userLocation.latitude,
          userLocation.longitude,
        );
        points.add(currentPostion);
        _add();
      });
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(width: 10.0),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: boxes("https://picsum.photos/id/1/200/200", 40.738380,
                  -73.988426, "Gramercy Tavven"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: boxes("https://picsum.photos/id/1011/200/200", 40.761421,
                  -73.981667, "Le Bernardin"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: boxes("https://picsum.photos/id/1016/200/200", 40.781421,
                  -73.961667, "Philippe Wuyts"),
            ),
          ],
        ),
      ),
    );
  }

  Widget boxes(String _image, double lat, double long, String restaurantName) {
    return GestureDetector(
      onTap: () {
        // _gotoLocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(24.0),
            // shadowColor: Color(0x802196F3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 180,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(24.0),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(_image),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myDetailsContainer1(restaurantName),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            restaurantName,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height: 5.0),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              "4.1",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
            Container(
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
                child: Text(
              "(946)",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
          ],
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }
}

class UserLocation {
  final double latitude;
  final double longitude;

  UserLocation({this.latitude, this.longitude});
}
