import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:maestros/src/widgets/menu/menu_lateral.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Animación de entrada
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Animación de salida y navegación a la siguiente pantalla
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 800),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Sistema de Incidencias",
            style: TextStyle(
                fontFamily: 'Roboto', // Cambia el nombre de la fuente aquí
                color: Colors.white), // Cambia el color de texto aquí
          ),
          backgroundColor:
              const Color(0xFF02A9DA), // Cambia el color de fondo aquí
        ),
        drawer: MenuLateral(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  'assets/svg/logo.png', // Ruta de la imagen del logo
                  scale: 1,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 20),
                const AutoSizeText(
                  '¡Bienvenido al Sistema de Reportes e Incidencias del Centro de Bachillerato Tecnológico Industrial y de Servicios No. 61!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 4,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Esta aplicación está diseñada para ayudar a los maestros en la gestión y notificación de incidencias que ocurran con los estudiantes. Con esta herramienta, podrás registrar y comunicar de manera eficiente cualquier situación relevante a los padres o tutores de los alumnos.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Algunas de las incidencias que podrás reportar incluyen:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  '- Ausencias a clases',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '- Falta de actividades y tareas',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '- Indisciplina en clases',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  '- Retardo en clases',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
