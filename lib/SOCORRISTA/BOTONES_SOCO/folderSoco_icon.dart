import "package:flutter/material.dart";

class FolderScreen_soco extends StatelessWidget {
  final String message;

  const FolderScreen_soco({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          // Agrega aquí otros widgets específicos para el estado de carpeta
        ],
      ),
    );
  }
}