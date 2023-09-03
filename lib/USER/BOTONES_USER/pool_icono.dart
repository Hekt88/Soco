import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PoolScreen extends StatefulWidget {
  final String message;

  PoolScreen({required this.message});

  @override
  _PoolScreenState createState() => _PoolScreenState();
}

class _PoolScreenState extends State<PoolScreen> {
  final List<String> messages = [
    "Recuerda echarte crema",
    "Recuerda hidratarte",
    "No dejes nunca a tus hijos sin la supervisión de un adulto",
    "Si tienes alguna duda, pregunta al socorrista",
    "La piscina es un espacio de disfrute, respeta a los demas :)"
  ];

  late int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  int _guestCount = 0;
  bool _isSent = false; // Variable para rastrear si se ha enviado

  void _incrementGuestCount() {
    setState(() {
      if (_guestCount < 10) {
        _guestCount++;
      }
    });
  }

  void _decrementGuestCount() {
    setState(() {
      if (_guestCount > 0) {
        _guestCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "Bienvenido Héctor",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "El cloro es de 1.5 y el pH del agua es de 7.",
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            "El aforo actual de la piscina es de 5 personas.",
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      
        SizedBox(height: 50), // Espacio entre el carrusel y el nuevo texto

        // Nuevo texto y contador
        Center(
          child: Column(
            children: [
              Text(
                "¿Has traído acompañantes? ¿Cuántos?",
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove, color: Colors.white),
                    onPressed: _decrementGuestCount,
                  ),
                  Text(
                    "$_guestCount",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: _incrementGuestCount,
                  ),
                ],
              ),

              SizedBox(height: 5),   //BOTON ENVIAR
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Cambia el estado del botón cuando se presiona
                    _isSent = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Establece el color de fondo en verde
                  minimumSize: Size(100, 40), // Establece el tamaño mínimo del botón
                ),
                child: Text(
                  _isSent ? "Enviado" : "Enviar", // Cambia el texto según el estado
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
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
            SizedBox(width: 5),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                ),
                child: CarouselSlider.builder(
                  carouselController: _carouselController,
                  itemCount: messages.length,
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    enlargeCenterPage: true,
                    aspectRatio: 5, // Reducido a la mitad
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
                        padding: EdgeInsets.all(20),
                        child: Text(
                          messages[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 5),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
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