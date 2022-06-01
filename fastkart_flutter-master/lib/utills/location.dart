import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMap extends StatefulWidget {
  @override
  _LocationMapState createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    );
  }
}

// class Loc extends StatefulWidget{
//   @override
//   State createState() {
//
//     return MyHomePageState();
//   }
//
// }
//
// class MyHomePageState extends State{
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       body: MyMap(),
//     );
//   }
//
// }
// class MyMap extends StatefulWidget {
//   @override
//   State createState() {
//     // TODO: implement createState
//     return MyMapState();
//   }
// }
//
// class MyMapState extends State {
//   LatLng latlong = null;
//   CameraPosition _cameraPosition;
//   GoogleMapController _controller;
//   Set<Marker> _markers = {};
//   TextEditingController locationController = TextEditingController();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _cameraPosition = CameraPosition(target: LatLng(0, 0), zoom: 10.0);
//     getCurrentLocation();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return SafeArea(
//         child: Stack(
//       children: [
//         (latlong != null)
//             ? GoogleMap(
//                 initialCameraPosition: _cameraPosition,
//                 onMapCreated: (GoogleMapController controller) {
//                   _controller = (controller);
//                   _controller.animateCamera(
//                       CameraUpdate.newCameraPosition(_cameraPosition));
//                 },
//                 markers: _markers,
//               )
//             : Container(),
//       ],
//     ));
//   }
//
//   Future getCurrentLocation() async {
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission != PermissionStatus.granted) {
//       LocationPermission permission = await Geolocator.requestPermission();
//       if (permission != PermissionStatus.granted) getLocation();
//       return;
//     }
//     getLocation();
//   }
//
//   List<Address> results = [];
//   getLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     print(position.latitude);
//
//     setState(() {
//       latlong =
//           new LatLng(position.latitude, position.longitude); //change location
//       _cameraPosition = CameraPosition(target: latlong, zoom: 10.0);
//       if (_controller != null)
//         _controller
//             .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
//
//       _markers.add(Marker(
//           markerId: MarkerId("a"),
//           draggable: true,
//           position: latlong,
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//           onDragEnd: (_currentlatLng) {
//             latlong = _currentlatLng;
//           }));
//     });
//
//     getCurrentAddress();
//   }
//
//   getCurrentAddress() async {
//     final coordinates = new Coordinates(latlong.latitude, latlong.longitude);
//     results = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//     var first = results.first;
//     if (first != null) {
//       var address;
//       address = first.featureName;
//       address = " $address, ${first.subLocality}";
//       address = " $address, ${first.subLocality}";
//       address = " $address, ${first.locality}";
//       address = " $address, ${first.countryName}";
//       address = " $address, ${first.postalCode}";
//
//       locationController.text = address;
//     }
//   }
// }
