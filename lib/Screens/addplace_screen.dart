import 'dart:io';

import 'package:favorite_places/Widgets/location_input.dart';
import 'package:favorite_places/providers/placeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/image_input.dart';


class AddPlacesScreen extends StatefulWidget {
  const AddPlacesScreen({super.key});

  @override
  State<AddPlacesScreen> createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  final _editingcontroller = TextEditingController();
File? _capturedimage;
  
    void _save(){
final  enteredtext=_editingcontroller.text;
// print('enteredtext is $enteredtext');
if(enteredtext.isEmpty && _capturedimage==null){
  return;
}else{
Provider.of<PlaceProvider>(context,listen: false).addplace(enteredtext,_capturedimage!);
Navigator.of(context).pop();
}
  }
  @override
  void dispose() {
    _editingcontroller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black87,Colors.white],
            
              )),
      child: Scaffold(
        
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: const Center(child: Text('Add New Places'))),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
               TextField(
                           controller: _editingcontroller,            
                decoration: const InputDecoration(labelText: 'Title'),
                style:const  TextStyle(color: Colors.redAccent),
                
                           ),
              const SizedBox(height: 15),
            
              InputImage(onPickImage:(aayoimage){
    _capturedimage=aayoimage;
              }),
              const SizedBox(height: 15,),
               LocationInput(),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: () {
                  _save();
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Place'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
