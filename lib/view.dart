// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mycampushyb/models/location_modal.dart';

//import 'package:navigator_listview/main.dart';

//void main() => runApp(const MyApp());

/*class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}*/

/*class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}*/

// ignore: must_be_immutable
class View extends StatefulWidget {
  final LocationModel destination;
  final LocationData? userLocation;

  View({Key? key, required this.userLocation, required this.destination})
      : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  LocationData? currentLocation;
  // ignore: non_constant_identifier_names
  String google_api_Key = "AIzaSyDzC-iCIhpjo8fLoSi4WxI3BzZowSZMC3I";

  void _onMapCreated(GoogleMapController controller) {
    // ignore: unused_local_variable
    late GoogleMapController mapController = controller;
  }

  // Object for PolylinePoints
  late PolylinePoints polylinePoints;

// List of coordinates to join
  List<LatLng> polylineCoordinates = [];

  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

// Map storing polylines created by connecting two points
  Map<PolylineId, Polyline> polylines = {};

// Create the polylines for showing the route between two places
  /* void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_Key,
      PointLatLng(
          widget.userLocation!.latitude!, widget.userLocation!.longitude!),
      PointLatLng(widget.destination.lat, widget.destination.long),
      travelMode: TravelMode.transit,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {
        PolylineId id = const PolylineId('poly');

        // Initializing Polyline
        Polyline polyline = Polyline(
          polylineId: id,
          color: Colors.red,
          points: polylineCoordinates,
          width: 3,
        );

        // Adding the polyline to the map
        polylines[id] = polyline;
      });
    }
  }*/

  @override
  void initState() {
    //getPolyPoints();
    super.initState();

    List<LatLng> latlen = [
      LatLng(widget.userLocation!.latitude!, widget.userLocation!.longitude!),
      LatLng(widget.destination.lat, widget.destination.long)
    ];

    for (int i = 0; i < latlen.length; i++) {
      /*_markers.add(
          // added markers
          Marker(
        markerId: MarkerId(i.toString()),
        position: latlen[i],
        infoWindow: const InfoWindow(
          title: 'route',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));*/
      setState(() {});
      _polyline.add(Polyline(
        polylineId: const PolylineId('1'),
        points: latlen,
        color: Colors.blue,
        width: 2,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    //final LatLng destination = const LatLng(location.lat!, location.long!);
    LatLng destination =
        LatLng(widget.destination.lat, widget.destination.long);
    // ignore: unused_local_variable
    LatLng userloc =
        LatLng(widget.userLocation!.latitude!, widget.userLocation!.longitude!);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.destination.location_name!),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: userloc,
            zoom: 15.5,
          ),
          //markers: _markers,
          // on below line we have enabled location
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          // on below line we have enabled compass location
          compassEnabled: true,
          // on below line we have added polylines
          polylines: _polyline,
          markers: {
            Marker(
              markerId: const MarkerId("source"),
              position: userloc,
              icon: BitmapDescriptor.defaultMarker,
            ),
            Marker(
              markerId: const MarkerId("destination"),
              position: destination,
              icon: BitmapDescriptor.defaultMarkerWithHue(90),
            )
          },
        ),
      ),
    );
  }
}
