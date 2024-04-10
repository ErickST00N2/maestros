import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

/// [buildCardFront] - Método que construye la tarjeta front de credenciales del maestro.
Widget buildCardFront(BuildContext context, databaseUser, double pi) {
  /// TODO: Falta implementar la tarjeta front, volver a modificar ladistribución de la tarjeta y agregar los datos, esta inconcluso.

  /// [size] - Es el tamaño de la pantalla que se obtiene del dispositivo.
  final size = MediaQuery.of(context).size;

  /// [maxWidthScreenCard] - Evaluamos la anchura de la pantalla para saber si
  /// nuestra credencial tendrá un ancho maximo de 700 pixeles o si sigue con
  /// el valor por defecto de 0.95.
  final maxWidthScreenCard =
      (size.width > 600.0) ? (600.0) : (size.width * 0.95);

  /// [relacionCredentialCardAspecto12] - Calculamos la relacion entre el ancho de la pantalla.
  final relacionCredentialCardAspecto12 = maxWidthScreenCard; //Equivalente a 12

  /// [relacionCredentialCardAspecto8] - Calculamos la relacion entre el alto de la pantalla.
  final relacionCredentialCardAspecto8 =
      relacionCredentialCardAspecto12 / 12 * 8; // Equivale a 8
  return Card(
    //color: cAplication.colorDeFondoCredenciales,
    elevation: 6,
    semanticContainer: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: SizedBox(
      width: relacionCredentialCardAspecto12,
      height: relacionCredentialCardAspecto8,
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox.expand(
                      child: Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          Image.asset(
                              'assets/backgrounds/credential/LOGO_SEP_VERTICAL.png',
                              alignment: Alignment.centerLeft),
                          Image.asset(
                            'assets/backgrounds/credential/logoDGTI.png',
                            alignment: Alignment.centerRight,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: <Widget>[
                            Flexible(
                              fit: FlexFit.loose,
                              flex: 4,
                              child: databaseUser.getPhotoURL2(),
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.loose,
                              child: Padding(
                                padding: const EdgeInsets.all(2.5),
                                child: Center(
                                  child: Text(
                                    //TODO: Aquí va el numero de control
                                    'CLAVE DE MAESTRO: ${databaseUser.claveMaestro}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Flex(
                          direction: Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Flex(
                                  direction: Axis.vertical,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "CENTRO DE BACHILLERATO TECNÓLOGICO INDUSTRIAL Y DE SERVICIOS No 61",
                                      style: TextStyle(
                                        fontSize: 11,
                                        height: 1.2,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "MAESTRO:",
                                      style: TextStyle(
                                          fontSize: 10,
                                          height: 1.2,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${databaseUser.nombre}",
                                      style: const TextStyle(
                                          fontSize: 12, height: 1.2),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "CURP:",
                                      style: TextStyle(
                                          fontSize: 10,
                                          height: 1.2,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${databaseUser.curp}",
                                      style: const TextStyle(
                                          fontSize: 12, height: 1.2),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Text(
                                      //TODO: AQUÍ VA EL NOMBRE DE LA DIRECTORA, FALTA AÑADIR LA FIRMA.
                                      "ING. MAIRA NAYANI HERNANDEZ JIMÉNEZ\nDIRECTORA",
                                      style: TextStyle(
                                          fontSize: 8,
                                          height: 1.2,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          ///Aqui va la carrera, grado y grupo en caso de que sea alumno.
          ///en el caso de los maestros solo va su especialidad.
          Expanded(
            flex: 2,
            child: SizedBox.expand(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: AutoSizeText(
                      //TODO: Aquí va la carrera, grado y grupo
                      "${databaseUser.especialidad.toString().toUpperCase()} ",
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
