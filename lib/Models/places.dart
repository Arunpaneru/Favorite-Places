
import 'dart:io';

import 'package:location/location.dart';
import 'package:uuid/uuid.dart';
const uuid=Uuid();
class Placelocation{
  final double latitude;
  final double longitude;
  final String ?address;
  Placelocation({required this.latitude,required this.longitude,this.address});
}
class Place{

  final String id;
  final String title;
  final File image;
  Location ?location;

  Place({required this.title,required this.image, this.location,}):id=uuid.v4();
}