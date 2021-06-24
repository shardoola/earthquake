import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleGoogleMap extends StatefulWidget {
  @override
  _SimpleGoogleMapState createState() => _SimpleGoogleMapState();
}

class _SimpleGoogleMapState extends State<SimpleGoogleMap> {
  GoogleMapController mapController;
  static LatLng _center = const LatLng(45.521563, -122.677433);

  void _onmapcreated(GoogleMapController controller ){

    mapController = controller;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("maps"),
      ),
      body: GoogleMap(
        markers: { portlandMarker },
        mapType: MapType.terrain,
        onMapCreated: _onmapcreated,
        initialCameraPosition: CameraPosition( target: _center, zoom:  11.0),

      ),
    );
  }
  Marker portlandMarker = Marker(markerId: MarkerId("Portland"),
    position: _center,
    infoWindow: InfoWindow(title: "Portland",snippet: "lalalala"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta)
  );
}
