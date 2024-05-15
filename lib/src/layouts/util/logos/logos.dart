import 'package:flutter/material.dart';

//Por el momento hay dos tipos de logotipos: Imagotipo y Isotipo.

/// Esta clase representa los logotipos y isotipos para la aplicación.
/// Todas las propiedades son privadas y no deberían ser modificadas por fuera de esta clase.
/// La única forma de acceder a estas propiedades es a través de los métodos getters.
/// Todos los métodos getters son const, lo que significa que devuelven el mismo valor cada vez que son llamados.
/// Todos los métodos getters devuelven un valor const, lo que significa que no pueden ser modificados.
/// Todos los métodos getters devuelven un objeto const, lo que significa que no pueden ser modificados.
/// Todos los métodos getters devuelven un objeto inmutable, lo que significa que no pueden ser modificados.
///
/// Cada uno de los métodos getters devuelve un objeto inmutable, por lo que puede ser utilizado directamente en una UI sin preocuparse por modificarlo.
///
/// Los métodos getters devuelven una nueva instancia de Image.asset() cada vez que son llamados, por lo que pueden ser utilizados directamente en una UI sin preocuparse por modificarlos.
class Logos {
  /// Propiedad inmutable que contiene la ruta del logotipo blanco como una imagen SVG.
  static const String _imagotipoBlanco =
      'assets/svg/credencialesqr_imagotipo_blanco.png';

  /// Propiedad inmutable que contiene la ruta del logotipo azul como una imagen SVG.
  static const String _imagotipoAzul =
      'assets/svg/credencialesqr_imagotipo_azul.png';

  /// Propiedad inmutable que contiene la ruta del isotipo blanco como una imagen SVG.
  static const String _isotipoBlanco =
      'assets/svg/credencialesqr_isotipo_blanco.png';

  /// Propiedad inmutable que contiene la ruta del isotipo azul como una imagen SVG.
  static const String _isotipoAzul =
      'assets/svg/credencialesqr_isotipo_azul.png';

  /// Devuelve el logotipo blanco como un widget inmutable.
  Widget imagotipoBlancoImgAsset(BuildContext context) =>
      Image.asset(_imagotipoBlanco);

  /// Devuelve el isotipo blanco como un widget inmutable.
  Widget isotipoBlancoImgAsset(BuildContext context) =>
      Image.asset(_isotipoBlanco);

  /// Devuelve el logotipo azul como un widget inmutable.
  Widget imagotipoAzulImgAsset(BuildContext context) =>
      Image.asset(_imagotipoAzul);

  /// Devuelve el isotipo azul como un widget inmutable.
  Widget isotipoAzulImgAsset(BuildContext context) => Image.asset(_isotipoAzul);
}
