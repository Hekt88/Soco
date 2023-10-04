import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserScreen_soco extends StatefulWidget {
  final String message;

  const UserScreen_soco({Key? key, required this.message}) : super(key: key);

  @override
  _UserScreen_socoState createState() => _UserScreen_socoState();
}

class _UserScreen_socoState extends State<UserScreen_soco> {
  File? _image;

  // Función para seleccionar una imagen desde la galería
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, top: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Contenedor para la foto de perfil
              GestureDetector(
                onTap: _pickImage, // Llamar a la función cuando se toca el contenedor
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: _image != null
                      ? ClipOval(
                          child: Image.file(
                            _image!,
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(
                          Icons.person,
                          size: 60.0,
                          color: Colors.white,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
