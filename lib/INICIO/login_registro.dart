import 'package:animated_bottom_app_bar/SOCORRISTA/login_soco.dart';
import 'package:animated_bottom_app_bar/USER/HOME_USER/home_user.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Inicio de Sesión',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildTextFieldContainer(
              labelText: 'Nombre de Usuario',
              icon: Icons.person,
            ),
            const SizedBox(height: 10),
            _buildPasswordFieldContainer(
              labelText: 'Contraseña',
              icon: Icons.lock,
              obscureText: _obscureText,
              toggleVisibility: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
              },
              icon: Icon(
                Icons.login,
                color: Colors.white,
              ),
              label: const Text(
                'Iniciar Sesión',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
            const SizedBox(height: 20), // Espacio entre botones
            ElevatedButton.icon(
              onPressed: () {
                // Lógica para el botón "Registrarse"
              },
              icon: Icon(
                Icons.person_add,
                color: Colors.white,
              ),
              label: const Text(
                'Registrarse',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Cambia el color del botón
              ),
            ),
            const SizedBox(height: 20), // Espacio entre botones
            ElevatedButton.icon(
              onPressed: () {
                // Lógica para el acceso del socorrista
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ZonaSocorristaPage(),
                  ),
                );
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: const Text(
                'Acceso socorrista',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple, // Color de fondo morado
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldContainer({
    required String labelText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: labelText,
              ),
              obscureText: obscureText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordFieldContainer({
    required String labelText,
    required IconData icon,
    required bool obscureText,
    required VoidCallback toggleVisibility,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: labelText,
                suffixIcon: GestureDetector(
                  onTap: toggleVisibility,
                  child: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
              obscureText: obscureText,
            ),
          ),
        ],
      ),
    );
  }
}