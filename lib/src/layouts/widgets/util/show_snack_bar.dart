import 'package:flutter/material.dart'
    show BuildContext, Colors, ScaffoldMessenger, SnackBar, Text;

/// Clase para mostrar un [SnackBar] con un mensaje y un color de fondo
/// específico.
class ShowSnackBar {
  /// Constructor de la clase.
  ShowSnackBar({required this.context});

  /// Contexto de construcción del widget.
  final BuildContext context;

  /// Muestra un [SnackBar] con un color de fondo verde azulado si [isSuccess]
  /// es true y un color de fondo rojo si [isSuccess] es false, y un mensaje
  /// indicando si se encontró un alumno.
  ///
  /// El parámetro [isSuccess] indica si se obtuvo un resultado exitoso.
  ///
  /// El parámetro [message] es el mensaje a mostrar.
  void showSnackBarMessage({required bool isSuccess, required String message}) {
    // Crea un widget SnackBar con un color de fondo verde azulado si
    // [isSuccess] es true y un color de fondo rojo si [isSuccess] es false, y
    // un mensaje indicando si se encontró un alumno.
    final snackBar = SnackBar(
      backgroundColor: isSuccess ? Colors.teal : Colors.red,
      content: Text(message),
    );

    // Muestra el SnackBar usando ScaffoldMessenger.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
