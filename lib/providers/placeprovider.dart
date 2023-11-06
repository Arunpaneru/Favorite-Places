import 'dart:io';
import 'package:favorite_places/Helpers/db_helper.dart';
import 'package:favorite_places/Models/places.dart';
import 'package:flutter/material.dart';

class PlaceProvider with ChangeNotifier {
  List<Place> _places = [];
  List<Place> get places {
    return [..._places];
  }

  void addplace(String title, File pickedimage) {
    final newplace = Place(title: title, image: pickedimage, location: null);
    _places.add(newplace);
// print(_places.length);
    notifyListeners();
    DB_Helper.insert('user_places', {
      'id': newplace.id,
      'title': newplace.title,
      'image': newplace.image.path,
    });
  }

  Future<void> fetchandsetplaces() async {
    final response = await DB_Helper.getdata('user_places');
    response.then((data) => _places = data
        .map((item) {
          print('the values are');
          print(item.values);
          return Place(
              title: item['title'].toString(), image: File(item['image']as String));
        })
        .cast<Place>()
        .toList());
        // print('lister notified');
    notifyListeners();
    
  }
}
