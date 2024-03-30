import 'package:flutter/material.dart';

class ShowSnackBar {
  BuildContext context;

  ShowSnackBar({required this.context});

  /// Muestra un [SnackBar] con un color de fondo verde azulado si [isSuccess] es true
  /// y un color de fondo rojo si [isSuccess] es false, y un mensaje indicando
  /// si se encontró un alumno.
  ///
  /// El parámetro [context] es del tipo [BuildContext] y representa el contexto
  /// de construcción del widget.
  ///
  /// El parámetro [isSuccess] es del tipo [bool] y representa si se obtuvo
  /// un resultado exitoso.
  ///
  /// El parámetro [message] es del tipo [String] y representa el mensaje a mostrar.
  void showSnackBarMessage(bool isSuccess, String message) {
    // Crea un widget SnackBar con un color de fondo verde azulado si [isSuccess] es true
    // y un color de fondo rojo si [isSuccess] es false, y un mensaje indicando
    // si se encontró un alumno.
    SnackBar snackBar = SnackBar(
      backgroundColor: isSuccess ? Colors.teal : Colors.red,
      content: Text(message),
    );

    // Muestra el SnackBar usando ScaffoldMessenger.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
