import 'package:favorite_places/Screens/mapsscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? previewimageurl;//to usepreview service we need creditcard for acessing google map API
  void currentlocation() async {
    // final clocation = await Location().getLocation();
    // print(clocation.latitude);
    // print(clocation.longitude);
    return;
  }

  Future<void> chooseonmap() async {
    final selectedlocation = await Navigator.of (context).push<LatLng>(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) =>  MapsScreen(
            isselecting: true,
          ),
        ));
        if (selectedlocation ==null){
          return;
        }
        print('The selected lan and long are ');
        print(selectedlocation.latitude);
                print(selectedlocation.longitude);

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
          child: previewimageurl == null
              ? const Text('NO location choosen')
              : Image.network(
                  previewimageurl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                  onPressed: () => currentlocation,
                  icon: const Icon(Icons.location_city),
                  label: const Text('Current Location')),
              TextButton.icon(
                  onPressed: chooseonmap,
                  icon: const Icon(Icons.map_rounded),
                  label: const Text('Choose Location on map'))
            ],
          ),
        )
      ],
    );
  }
}
