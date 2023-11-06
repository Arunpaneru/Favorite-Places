// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InputImage extends StatefulWidget {
 Function (File image) onPickImage;
   InputImage({super.key,required this.onPickImage});

  @override
  State<InputImage> createState() => _InputImageState();
}

class _InputImageState extends State<InputImage> {
 File? _capturedimage;

  void _takepicture() async {
    final imagepicker = ImagePicker();
    final pickedimage =
        await imagepicker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (pickedimage == null) {
      return;
    } else {
      setState(() {
        _capturedimage = File(pickedimage.path);
      });
      widget.onPickImage(_capturedimage!);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
        onPressed: _takepicture,
        icon: const Icon(Icons.camera),
        label: const Text('Click Picture'));
    if (_capturedimage != null) {
      content = GestureDetector(
        onTap: _takepicture,
          child: Image.file(
        _capturedimage!,
        fit: BoxFit.cover,
        width: double.infinity,
      height: double.infinity,
        
      ));
    }

    return Container(
      height: 300,
      width: double.infinity,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
      child: content,
    );
  }
}
