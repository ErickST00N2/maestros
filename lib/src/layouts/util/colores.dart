import 'package:flutter/material.dart';

class ColoresApp {
  // Constructor privado
  ColoresApp._private();

  // Definición de instancia privada
  static final ColoresApp _instancia = ColoresApp._private();

  // Definición de factor de creacion de instancia
  factory ColoresApp() {
    return _instancia;
  }
  // Definición de constantes para valores de colores utilizados en la aplicación
  /// [fuerte] - Color de fuerte de la aplicación
  /// [Color(fuerte)].
  final int fuerte = 0xFF186DDE;

  final int fuerte2 = 0xFF0F84D1;

  static int fuerte3 = 0xFF069BDF;

  final Color colorAppBar = Color(fuerte3);

  /// [fuerteMedio] - Color de Medio - fuerte de la aplicación.
  /// [Color(fuerteMedio)].
  final int fuerteMedio = 0xFF0F84D1;

  /// [medio] - Color de medio de la aplicación.
  /// [Color(medio)].
  final int medio = 0xFF069BDF;

  /// [bajo] - Color de bajo de la aplicación.
  /// [Color(bajo)].
  final int bajo = 0xFF02A9DA;

  /// [error] - Color de error de la aplicación.
  /// [Color(error)].
  final int error = 0xF99F0000;

  /// [colorDeFondoCredenciales] - Color de fondo de las credenciales. tiene un transparencia de 70%
  ///[Color(colorDeFondoCredenciales)]. El color de la credencial no tiene transparencia
  final Color? colorDeFondoCredenciales =
      const Color.fromARGB(255, 230, 212, 212);

  final Color colorDelAppBar = const Color.fromRGBO(2, 169, 218, 1);
}
