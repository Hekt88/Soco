import 'package:flutter/foundation.dart';
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

  // Function to select an image from the gallery
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
              // Icono de usuario y aro_salvavidas.png
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 140.0,
                  height: 140.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/aro_salvavidas.png',
                        width: 140.0,
                        height: 140.0,
                        fit: BoxFit.cover,
                      ),
                      Center(
                        child: _image != null
                            ? ClipOval(
                                child: kIsWeb
                                    ? Image.network(
                                        _image!.path,
                                        width: 90.0,
                                        height: 90.0,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.file(
                                        _image!,
                                        width: 90.0,
                                        height: 90.0,
                                        fit: BoxFit.cover,
                                      ),
                              )
                            : Icon(
                                Icons.person,
                                size: 70.0,
                                color: Colors.white,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.0), // Espacio entre el icono de perfil y los botones

              // Contenedor para los 5 botones de texto
              Container(
                alignment: Alignment.bottomCenter, // Alineación horizontal de los botones de texto
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Acción para "Piscina asignada"
                      },
                      child: Text("Piscina asignada"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          Size(200.0, 50.0), // Ancho y alto fijo para el botón
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.white), // Color de fondo blanco
                        foregroundColor: MaterialStateProperty.all(Colors.black), // Color del texto negro
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Curvatura reducida
                            side: BorderSide(color: Colors.black), // Contorno negro
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    ElevatedButton(
                      onPressed: () {
                        // Acción para "Datos socorrista"
                      },
                      child: Text("Datos socorrista"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          Size(200.0, 50.0),
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    ElevatedButton(
                      onPressed: () {
                        // Acción para "Horario"
                      },
                      child: Text("Horario"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          Size(200.0, 50.0),
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    ElevatedButton(
                      onPressed: () {
                        // Acción para "Guía del buen socorrista"
                      },
                      child: Text(
                        "Guía del buen socorrista",
                        textAlign: TextAlign.center,),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          Size(200.0, 50.0),
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    ElevatedButton(
                      onPressed: () {
                        // Acción para "Activación de clientes"
                      },
                      child: Text("Activación de clientes"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          Size(200.0, 50.0),
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        foregroundColor: MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
