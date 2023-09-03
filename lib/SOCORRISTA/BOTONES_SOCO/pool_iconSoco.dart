import 'package:flutter/material.dart';

class PoolScreen_soco extends StatefulWidget {
  final String message;

  PoolScreen_soco({required this.message});

  @override
  _PoolScreen_socoState createState() => _PoolScreen_socoState();
}

class _PoolScreen_socoState extends State<PoolScreen_soco> {
  int contador = 0; // Variable para mantener el contador
  bool checkPresionado = false; // Variable para controlar el estado del emoji de check
  bool enviado = false; // Variable para controlar si se ha enviado

  // Controladores para los campos de texto de los contenedores grises
  TextEditingController fechaController = TextEditingController();
  TextEditingController horaController = TextEditingController();
  TextEditingController phController = TextEditingController();
  TextEditingController cloroLibreController = TextEditingController();
  TextEditingController cloroCombinadoController = TextEditingController();
  TextEditingController cloroResidualController = TextEditingController();
  TextEditingController aguaDepuradaController = TextEditingController();
  TextEditingController aguaRenovadaController = TextEditingController();

  @override
  void dispose() {
    // Dispose de los controladores al finalizar
    fechaController.dispose();
    horaController.dispose();
    phController.dispose();
    cloroLibreController.dispose();
    cloroCombinadoController.dispose();
    cloroResidualController.dispose();
    aguaDepuradaController.dispose();
    aguaRenovadaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5.0),
          _buildTitle(),
          SizedBox(height: 10.0),
          _buildSubtitle(),
          SizedBox(height: 10.0),
          _buildDataGrid([
            'Fecha',
            'Hora',
            'P.H',
            'Cloro libre',
            'Cloro combinado',
            'Cloro residual',
            'Agua depurada',
            'Agua renovada'
          ]),
          SizedBox(height: 10.0),
          _buildButtonsRow(),
          SizedBox(height: 10.0),
          _buildCounterField(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Bienvenido Socorrista',
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'Libro Registro',
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }

  Widget _buildDataGrid(List<String> texts) {
    final List<Widget> rows = [];
    for (var i = 0; i < texts.length; i += 2) {
      if (i + 1 < texts.length) {
        rows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextContainer(texts[i], i),
              SizedBox(width: 3.0),
              _buildTextContainer(texts[i + 1], i + 1),
            ],
          ),
        );
      } else {
        rows.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextContainer(texts[i], i),
            ],
          ),
        );
      }
    }
    return Column(
      children: rows,
    );
  }

  Widget _buildTextContainer(String hintText, int index) {
    TextEditingController controller;
    switch (index) {
      case 0:
        controller = fechaController;
        break;
      case 1:
        controller = horaController;
        break;
      case 2:
        controller = phController;
        break;
      case 3:
        controller = cloroLibreController;
        break;
      case 4:
        controller = cloroCombinadoController;
        break;
      case 5:
        controller = cloroResidualController;
        break;
      case 6:
        controller = aguaDepuradaController;
        break;
      case 7:
        controller = aguaRenovadaController;
        break;
      default:
        controller = TextEditingController();
        break;
    }

    return Container(
      width: 160.0,
      height: 60.0,
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 3.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hintText,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 0),
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(fontSize: 12.0),
              onChanged: (value) {
                // Verificar si todos los campos están llenos
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: hintText != 'Aforo' ? 'Insertar $hintText' : 'Introduce Aforo',
                hintStyle: TextStyle(fontSize: 12.0),
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(4.0, -4.0, 4.0, 4.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            // Función para limpiar los datos, puedes implementarla según tus necesidades
            // Por ejemplo, aquí se borran los datos de los controladores de texto
            fechaController.clear();
            horaController.clear();
            phController.clear();
            cloroLibreController.clear();
            cloroCombinadoController.clear();
            cloroResidualController.clear();
            aguaDepuradaController.clear();
            aguaRenovadaController.clear();
            // También puedes resetear otras variables según tus requerimientos
            setState(() {
              // contador = 0;
              // checkPresionado = false;
              // camposCompletos = false;
              enviado = false;
            });
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent, // Fondo transparente
            onPrimary: Colors.black, // Color de texto negro
            elevation: 0, // Sin elevación
          ),
          child: Text(
            'Limpiar datos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 10.0), // Espacio entre los botones
        ElevatedButton(
          onPressed: () {
            if (camposCompletos()) { // Verificar si todos los campos están llenos
              setState(() {
                enviado = true; // Cambiar el estado a "Enviado" solo si no ha sido enviado previamente
              });
            }
          },
          style: ElevatedButton.styleFrom(
            primary: enviado ? Colors.green : Color.fromARGB(255, 255, 0, 0), // Cambiar el color del botón a verde cuando se envía
            onPrimary: Colors.white, // Color de texto blanco
            elevation: 0, // Sin elevación
          ),
          child: Text(enviado ? 'Enviado' : 'Enviar'), // Cambiar el texto del botón a "Enviado" cuando se envía
        ),
      ],
    );
  }

  Widget _buildCounterField() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Aforo: ',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Color negro
              ),
            ),
            SizedBox(width: 10.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  contador--; // Decrementar el contador
                  checkPresionado = false; // Resetear el estado del emoji de check a rojo
                });
              },
              child: Text(
                '<',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Color negro
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Text(
              contador.toString(), // Mostrar el contador actual
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Color negro
              ),
            ),
            SizedBox(width: 10.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  contador++; // Incrementar el contador
                  checkPresionado = false; // Resetear el estado del emoji de check a rojo
                });
              },
              child: Text(
                '>', // Emoji de incremento
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Color negro
                ),
              ),
            ),
            SizedBox(width: 10.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  // Cambiar el estado del emoji de check
                  checkPresionado = !checkPresionado;
                });
              },
              child: Text(
                '✓', // Emoji de checkmark
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: checkPresionado ? Colors.green : Colors.red, // Cambiar el color del emoji de check
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  bool camposCompletos() {
    // Verificar si todos los campos de texto están llenos
    return fechaController.text.isNotEmpty &&
        horaController.text.isNotEmpty &&
        phController.text.isNotEmpty &&
        cloroLibreController.text.isNotEmpty &&
        cloroCombinadoController.text.isNotEmpty &&
        cloroResidualController.text.isNotEmpty &&
        aguaDepuradaController.text.isNotEmpty &&
        aguaRenovadaController.text.isNotEmpty;
  }
}
