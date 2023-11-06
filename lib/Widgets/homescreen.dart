import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
    static final CameraPosition _initial=CameraPosition(target: LatLng(37.42796133580664, -122.085749655962),zoom: 14.4746);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map')),
      body: GoogleMap(initialCameraPosition:_initial ),
    );
  }
}