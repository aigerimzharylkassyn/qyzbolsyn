import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:qyzbolsynapp1/constants/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';


class OrderTrackingPage extends StatefulWidget {
  const OrderTrackingPage({Key? key}) : super(key: key);

  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();
  bool isBottomSheetOpen = false;

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  void _openBottomSheet() {
    setState(() {
      isBottomSheetOpen = true;
    });

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'SOS',
                style: TextStyle(
                  color: Color(0xFFC575C7),
                  fontSize: 35.0,
                  fontFamily: "GoldPlay"
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _makeEmergencyCall('tel:102');
                  Navigator.pop(context); // Close the bottom sheet
                },
                style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // Set the desired border radius
                ),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Color(0xFFF1F1F1),
                ),
                child: Text(
                  '"102" POLİSİAĞA QOÑYRAU',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "GoldPlay2"
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Handle second button click
                  Navigator.pop(context); // Close the bottom sheet
                },
                style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // Set the desired border radius
                ),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Color(0xFFF1F1F1),
                ),
                
                child: Text(
                  'JAQYNDARĞA ZHAZU',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "GoldPlay2"
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ).then((value) {
      setState(() {
        isBottomSheetOpen = false;
      });
    });
  }

  void getCurrentLocation() {
    Location location = Location();

    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );

    location.onLocationChanged.listen(
      (newLoc) {
        currentLocation = newLoc;

        setState(() {});
      },
    );
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
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
    getCurrentLocation();
    getPolyPoints();
    super.initState();
  }

void _makeEmergencyCall(String phoneNumber) async {
  Uri uri = Uri.parse(phoneNumber);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $phoneNumber';
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          toolbarHeight: 110, // increase the height of AppBar
          title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
          "Sälem, qūrbym!",
          style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold, fontFamily: "GoldPlay"),
        ),
        Text(
          "Senı körgenıme quanyştymyn 💜",
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "Goldplay"),
        ),
      ],
    ),
    
  ),

      body: currentLocation == null
          ? const Center(child: Text("Loading"))
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                zoom: 10,
              ),
              polylines: {
                Polyline(
                  polylineId: PolylineId("route"),
                  points: polylineCoordinates,
                  color: primaryColor,
                  width: 6,
                ),
              },
              markers: {
                Marker(
                  markerId: MarkerId("currentLocation"),
                  position: LatLng(
                      currentLocation!.latitude!, currentLocation!.longitude!),
                ),
                Marker(
                  markerId: MarkerId("source"),
                  position: sourceLocation,
                ),
                Marker(
                  markerId: MarkerId("destination"),
                  position: destination,
                ),
              },
              onMapCreated: (mapController) {
                _controller.complete(mapController);
              },
            ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 80.0),
        child: ElevatedButton(
          onPressed: () {
            if (!isBottomSheetOpen) {
              _openBottomSheet();
            }
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Set the desired border radius
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.0), // Set the desired padding
            backgroundColor: Color(0xFFC575C7), // Set the desired background color
          ),
          child: Text(
            'SOS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

