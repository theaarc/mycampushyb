import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// ignore: unused_import
import 'package:mycampushyb/models/location_modal.dart';
// ignore: unused_import
import 'package:mycampushyb/view.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  /*
  Completer<GoogleMapController> mapController = Completer();

  final LatLng test0 = const LatLng(3.832025791091983, 11.49721453284984);
  final LatLng test1 = const LatLng(3.834723408798464, 11.485069491262495);

  // ignore: prefer_collection_literals
  final Set<Marker> _markers = Set<Marker>();
  late LatLng currentLocation;
  late LatLng destinationLocation;

  // ignore: prefer_collection_literals
  final Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;

  @override
  void initState() {
    super.initState();
    polylinePoints = PolylinePoints();
    // ignore: unnecessary_this
    this.setInitialLocation();
  }

  void setInitialLocation() {
    currentLocation = LatLng(test0.latitude, test0.longitude);
    destinationLocation = LatLng(test1.latitude, test1.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Direction"),
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        compassEnabled: false,
        tiltGesturesEnabled: false,
        polylines: _polylines,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          mapController.complete(controller);

          showMarker();
          setPolylines();
        },
        initialCameraPosition: CameraPosition(
          target: test0,
          zoom: 13,
        ),
      ),
    );
  }

  void showMarker() {
    setState(() {
      _markers.add(Marker(
        markerId: const MarkerId('sourcePin'),
        position: currentLocation,
        icon: BitmapDescriptor.defaultMarker,
      ));

      _markers.add(Marker(
        markerId: const MarkerId('destinationPin'),
        position: destinationLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(90),
      ));
    });
  }

  void setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyDzC-iCIhpjo8fLoSi4WxI3BzZowSZMC3I",
        PointLatLng(currentLocation.latitude, currentLocation.longitude),
        PointLatLng(
            destinationLocation.latitude, destinationLocation.longitude));

    if (result.status == 'OK') {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }

      setState(() {
        _polylines.add(Polyline(
            width: 10,
            polylineId: const PolylineId('polyLine'),
            color: const Color(0xFF08A5CB),
            points: polylineCoordinates));
      });
    }
  }
}

  LocationData? currentLocation;
  // ignore: non_constant_identifier_names
  String google_api_Key = "AIzaSyBR9Jd9dUHLXC7JKqJ_zAVJcoM38KMTEcs";

  final LatLng test0 = const LatLng(3.832025791091983, 11.49721453284984);
  final LatLng test1 = const LatLng(3.834723408798464, 11.485069491262495);

  void _onMapCreated(GoogleMapController controller) {
    // ignore: unused_local_variable
    late GoogleMapController mapController = controller;
  }

  // Object for PolylinePoints
  late PolylinePoints polylinePoints;

// List of coordinates to join
  List<LatLng> polylineCoordinates = [];

// Map storing polylines created by connecting two points
  Map<PolylineId, Polyline> polylines = {};

// Create the polylines for showing the route between two places
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_Key,
      PointLatLng(test0.latitude, test0.longitude),
      PointLatLng(test1.latitude, test1.longitude),
      //travelMode: TravelMode.transit,
    );

    if (result.points.isNotEmpty) {
      // ignore: avoid_function_literals_in_foreach_calls
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final LatLng destination = const LatLng(location.lat!, location.long!);
    // LatLng destination =
    //LatLng(widget.destination.lat, widget.destination.long);
    // ignore: unused_local_variable
    //LatLng userloc =
    // LatLng(widget.userLocation!.latitude!, widget.userLocation!.longitude!);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("TEST"),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: test0,
            zoom: 14.5,
          ),
          polylines: {
            Polyline(
              polylineId: const PolylineId("route"),
              points: polylineCoordinates,
              color: const Color.fromARGB(255, 40, 122, 198),
            )
          },
          markers: {
            Marker(
              markerId: const MarkerId("source"),
              position: test0,
            ),
            Marker(
              markerId: const MarkerId("destination"),
              position: test1,
            )
          },
        ),
      ),
    );
  }
}
*/

  // ignore: non_constant_identifier_names
  static List<LocationModel> main_location_list = [
    LocationModel(
        "Departement de mathematique", 3.8589271010356456, 11.499978263980255),
    LocationModel(
        "Departement de Informatique", 3.8589271010356456, 11.499978263980255),
    LocationModel(
        "Departement de Physique", 3.859244222134241, 11.499482055310919),
    LocationModel(
        "Departement de chimie", 3.8591626002627604, 11.49945657432573),
    LocationModel("Salle S111", 3.8589271010356456, 11.499978263980255),
    LocationModel("Salle S005", 3.8589271010356456, 11.499978263980255),
    LocationModel("Amphi 1001", 3.859898534903885, 11.500741352448035),
    LocationModel("Amphi 1002", 3.860179527955433, 11.500387300864377),
    LocationModel("Amphi 1003", 3.85557723533884, 11.501247901389668),
    LocationModel("Faculte des Art", 3.8571842789978485, 11.5012161297827),
    LocationModel("Canal Olympia", 3.859528568529104, 11.496377425051344),
    LocationModel("Mateco", 3.856173361130136, 11.497368473958621),
    LocationModel("Block Pedagogique", 3.8570993038740555, 11.500699777365497),
    LocationModel(
        "Bibliotheque Centre", 3.8571776149719237, 11.501521398302188),
  ];

  // ignore: non_constant_identifier_names
  List<LocationModel> display_list = List.from(main_location_list);

  void updateList(String value) {
    setState(() {
      display_list = main_location_list
          .where((element) => element.location_name!
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  /// *--------------------------------------getting users location------------------------------------
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  LocationData? _userLocation;
  // ignore: non_constant_identifier_names

  final LatLng test0 = const LatLng(3.8589271010356456, 11.499978263980255);
  // ignore: non_constant_identifier_names
  late LocationData temp_user = test0 as LocationData;

  Future<LocationData?> _getUserLocation() async {
    Location location = Location();

    // Check if location service is enable
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        //return null;
      }
    }

    // Check if permission is granted
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        //return null;
      }
    }

    final locationData = await location.getLocation();
    setState(() {
      _userLocation = locationData;
    });

    return _userLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "MYCAMPUS",
          style: TextStyle(
              color: Color.fromARGB(255, 102, 179, 106),
              fontSize: 40.0,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Search for a location",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide:
                      const BorderSide(width: 3, color: Colors.greenAccent),
                ),
                hintText: "eg: Departement Informatique",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: const Color.fromARGB(255, 153, 148, 148),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: display_list.length,
                  itemBuilder: (context, index) {
                    final loc = display_list[index];

                    return Card(
                        child: ListTile(
                            title: Text(
                              loc.location_name!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              _getUserLocation();
                              _userLocation != null
                                  ? Navigator.of(context)
                                      .push(MaterialPageRoute(
                                      builder: (context) => View(
                                        userLocation: _userLocation,
                                        destination: loc,
                                      ),
                                    ))
                                  : MyApp();
                            }));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
