import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PoolScreen extends StatefulWidget {
  final String message;

  const PoolScreen({super.key, required this.message});

  @override
  _PoolScreenState createState() => _PoolScreenState();
}

class _PoolScreenState extends State<PoolScreen> {
  final List<String> messages = [
    "Recuerda echarte crema",
    "Recuerda hidratarte",
    "No dejes nunca a tus hijos sin la supervisión de un adulto",
    "Si tienes alguna duda, pregunta al socorrista",
    "La piscina es un espacio de disfrute, respeta a los demás :)"
  ];

  late int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  int _guestCount = 0;
  bool _isSent = false; // Variable para rastrear si se ha enviado

  void _incrementGuestCount() {
    setState(() {
      if (_guestCount < 10) {
        _guestCount++;
        _isSent = false; // Volver a estado inicial (rojo) cuando se cambia el contador
      }
    });
  }

  void _decrementGuestCount() {
    setState(() {
      if (_guestCount > 0) {
        _guestCount--;
        _isSent = false; // Volver a estado inicial (rojo) cuando se cambia el contador
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text(
            "Bienvenido Héctor",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text(
            "El cloro es de 1.5 y el pH del agua es de 7.",
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text(
            "El aforo actual de la piscina es de 5 personas.",
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),

        const SizedBox(height: 50), // Reducida la distancia entre el carrusel y el nuevo texto

        // Nuevo texto y contador
        Center(
          child: Column(
            children: [
              const Text(
                "¿Has traído acompañantes? ¿Cuántos?",
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, color: Colors.white),
                    onPressed: _decrementGuestCount,
                  ),
                  Text(
                    "$_guestCount",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: _incrementGuestCount,
                  ),
                ],
              ),

              const SizedBox(height: 5), //BOTON ENVIAR
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Cambia el estado del botón cuando se presiona
                    _isSent = !_isSent;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isSent ? Colors.green : Colors.red, // Cambia el color
                  minimumSize: const Size(100, 40), // Establece el tamaño mínimo del botón
                ),
                child: Text(
                  _isSent ? "Enviado" : "Enviar", // Cambia el texto según el estado
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10), // Espacio entre el contador y el carrusel
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                setState(() {
                  if (_currentIndex > 0) {
                    _currentIndex--;
                    _carouselController.previousPage();
                  } else {
                    _currentIndex = messages.length - 1;
                    _carouselController.jumpToPage(messages.length - 1);
                  }
                });
              },
            ),
            const SizedBox(width: 5),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100, // Ancho fijo
              child: CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: messages.length,
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  enableInfiniteScroll: true,
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        messages[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              onPressed: () {
                setState(() {
                  if (_currentIndex < messages.length - 1) {
                    _currentIndex++;
                    _carouselController.nextPage();
                  } else {
                    _currentIndex = 0;
                    _carouselController.jumpToPage(0);
                  }
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
