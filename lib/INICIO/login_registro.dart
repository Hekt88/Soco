import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_app_bar/INICIO/registro.dart';
import 'package:animated_bottom_app_bar/SOCORRISTA/login_soco.dart';
import 'package:animated_bottom_app_bar/USER/HOME_USER/home_user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isButtonEnabled = false;

  void _signInWithFirebase() async {
    try {
      final String username = _usernameController.text.trim();
      final String password = _passwordController.text;

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: username, // Usamos el campo de usuario como email
        password: password,
      );

      if (userCredential.user != null) {
        // Las credenciales son válidas, puedes navegar a la siguiente pantalla.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(),
          ),
        );
      } else {
        // El usuario no se autenticó correctamente, muestra un mensaje de error.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error de inicio de sesión: Usuario no válido'),
          ),
        );
      }
    } catch (e) {
      // Ocurrió un error durante la autenticación, muestra un mensaje de error.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error de inicio de sesión: $e'),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // Agregamos controladores de texto para los campos de usuario y contraseña
    _usernameController.addListener(_checkButtonStatus);
    _passwordController.addListener(_checkButtonStatus);
  }

  @override
  void dispose() {
    // Liberamos los controladores de texto cuando no se necesiten
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Esta función verifica si ambos campos están llenos y habilita/deshabilita el botón
  void _checkButtonStatus() {
    setState(() {
      _isButtonEnabled = _usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

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
              controller: _usernameController,
            ),
            const SizedBox(height: 10),
            _buildPasswordFieldContainer(
              labelText: 'Contraseña',
              icon: Icons.lock,
              controller: _passwordController,
              obscureText: _obscureText,
              toggleVisibility: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _isButtonEnabled ? _signInWithFirebase : null, // Deshabilita el botón si no hay datos
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationScreen(),
                  ),
                );
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
    required TextEditingController controller,
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
              controller: controller,
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
    required TextEditingController controller,
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
              controller: controller,
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
