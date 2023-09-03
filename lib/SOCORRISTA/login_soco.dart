import 'package:animated_bottom_app_bar/SOCORRISTA/HOME_SOCO/home_soco.dart';
import 'package:flutter/material.dart';

class ZonaSocorristaPage extends StatefulWidget {
  @override
  _ZonaSocorristaPageState createState() => _ZonaSocorristaPageState();
}

class _ZonaSocorristaPageState extends State<ZonaSocorristaPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zona Socorrista"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
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
            ElevatedButton(
              onPressed: () {
                // Lógica para el inicio de sesión del socorrista
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePageSoco(),
                  ),
                );
              },
              child: const Text(
                'Iniciar Sesión',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
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