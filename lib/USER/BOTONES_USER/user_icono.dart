import 'package:flutter/material.dart';
import '../../INICIO/login_registro.dart'; // Importa el archivo de la página de inicio de sesión

class UserScreen extends StatelessWidget {
  final String message;

  const UserScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(height: 20), // Espacio entre el texto y el botón
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
            child: const Text('Volver'),
          ),
          // Agrega aquí otros widgets específicos para el estado de usuario
        ],
      ),
    );
  }
}