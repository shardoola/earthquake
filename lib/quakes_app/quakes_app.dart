import 'dart:async';

import 'package:earthquake/quakes_app/Quake.dart';
import 'package:earthquake/quakes_app/network.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class QuakesApp extends StatefulWidget {
  @override
  _QuakesAppState createState() => _QuakesAppState();
}

class _QuakesAppState extends State<QuakesApp> {
  Future <Quake>  _quakesData;
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markerList = <Marker>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _quakesData = Network().getAllQuakes();
    _quakesData.then((value) => {
print("place : ${value.features[0].geometry.coordinates[0]}")

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildGooglmaps(context)
        ],




      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            findQuakes();

          },

          label: Text("Find Quakes")),
    );
  }

 Widget  _buildGooglmaps(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(target: LatLng(36.1083333,-117.8608333),zoom: 3.0),
        markers: Set<Marker>.of(_markerList),


      ),

    );



  }

  void findQuakes() {

    setState(() {
      _markerList.clear();
      _handleResponse();
    });

  }

  void _handleResponse() {

    _quakesData.then((quakes) => {

      quakes.features.forEach((quake) => {
        _markerList.add(Marker(markerId: MarkerId(quake.id),
          infoWindow:  InfoWindow(title:  quake.properties.mag.toString(),
          snippet: quake.properties.title),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
          position: LatLng(quake.geometry.coordinates[1], quake.geometry.coordinates[0]),
          onTap: (){}
        ),

        )

      })

    });


  }
}
