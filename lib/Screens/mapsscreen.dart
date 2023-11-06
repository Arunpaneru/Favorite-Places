// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
final bool isselecting;
    MapsScreen({super.key,  this.isselecting=false});
  @override
  State<MapsScreen> createState() => MapsScreenState();
}

class MapsScreenState extends State<MapsScreen> {
    static const CameraPosition _initial=CameraPosition(target: LatLng(37.42796133580664, -122.085749655962),zoom: 14.4746);
     LatLng _pickedlocation=LatLng(37.42796133580664, -122.085749655962);
void _selectlocation(LatLng position){
  setState(() {
    _pickedlocation=position;
  });
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Center(child: Text('Choose Locaation')),actions: [
        if(widget.isselecting)
        IconButton(onPressed: () {
        Navigator.of(context).pop(_pickedlocation);
      }, icon: Icon(Icons.check))],),
      body:  GoogleMap(initialCameraPosition:_initial ,onTap: widget.isselecting ?_selectlocation:null,
      // ignore: unnecessary_null_comparison
      markers:  <Marker>{Marker(markerId: MarkerId('m1'),position: _pickedlocation )},)
    );
  }
}