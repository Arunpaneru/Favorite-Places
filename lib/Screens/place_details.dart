import 'package:favorite_places/Models/places.dart';
import 'package:flutter/material.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({
    super.key,
    required this.place,
  });
  final Place place;
// File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(place.title)),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.white)),
            child: Image.file(place.image,fit: BoxFit.cover,),
          ),
        ],
      )
      
    );
  }
}
