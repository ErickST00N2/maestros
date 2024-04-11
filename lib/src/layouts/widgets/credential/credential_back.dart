import 'package:flutter/material.dart';
import 'package:maestros/src/providers/user.dart';
import 'package:provider/provider.dart';

import 'package:qr_flutter/qr_flutter.dart';

/// [buildCardBack] - Método que construye la tarjeta back de credenciales del
/// maestro.
Widget buildCardBack({required BuildContext context, required double pi}) {
  /// [size] - Es el tamaño de la pantalla que se obtiene del dispositivo.
  final size = MediaQuery.of(context).size;

  /// [maxWidthScreenCard] - Evaluamos la anchura de la pantalla para saber si
  /// nuestra credencial tendrá un ancho maximo de 700 pixeles o si sigue con
  /// el valor por defecto de 0.95.
  final maxWidthScreenCard =
      (size.width > 600.0) ? (600.0) : (size.width * 0.95);

  /// [relacionCredentialCardAspecto12] - Calculamos la relacion entre el ancho
  /// de la pantalla.
  final relacionCredentialCardAspecto12 = maxWidthScreenCard; //Equivalente a 12

  /// [relacionCredentialCardAspecto8] - Calculamos la relacion entre el alto
  /// de la pantalla.
  final relacionCredentialCardAspecto8 =
      relacionCredentialCardAspecto12 / 12 * 8; // Equivale a 8

  /// [typeSystem] - Tipo de sistema
  final typeSystem = context.watch<UserModel>().typeSystem;

  /// [turn] - Turno
  final turn = context.watch<UserModel>().turn;

  /// [dateEmition] - Fecha de emision
  final dateEmition = context.watch<UserModel>().dateEmition;

  /// [schoolCycle] - Ciclo escolar
  final schoolCycle = context.watch<UserModel>().schoolCycle;
  return Card(
    //color: cAplication.colorDeFondoCredenciales,
    elevation: 6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: SizedBox(
      width: relacionCredentialCardAspecto12,
      height: relacionCredentialCardAspecto8,
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Aqui va el tipo de sistema y el turno
                    Flexible(
                      flex: 8,
                      child: Flex(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        direction: Axis.vertical,
                        children: [
                          Text(
                            typeSystem,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            turn,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Aqui va la fecha de emision y ciclo escolar
                    Flexible(
                      flex: 4,
                      child: Flex(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        direction: Axis.vertical,
                        children: [
                          //Aqui va la fecha de emision
                          Flexible(
                            child: Flex(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              direction: Axis.vertical,
                              children: [
                                const Text(
                                  'FECHA DE EMISION',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                  ),
                                ),
                                Text(
                                  dateEmition,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //Aqui va el ciclo escolar
                          Flexible(
                            child: Flex(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              direction: Axis.vertical,
                              children: [
                                const Text(
                                  'CICLO ESCOLAR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                  ),
                                ),
                                Text(
                                  schoolCycle,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: SizedBox.expand(
                            child: Image.asset(
                              'assets/backgrounds/credential/logoDGTI.png',
                              scale: .1,
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Flex(
                            direction: Axis.horizontal,
                            children: <Widget>[
                              Text(
                                context
                                    .watch<UserModel>()
                                    .nivelEducativo
                                    .toUpperCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFF0F84D1)),
                              color: Colors.white,
                            ),
                            child: SizedBox.expand(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text('Firma del Alumno'.toUpperCase()),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: QrImageView(
                    key: const Key('QrImage'),
                    padding: const EdgeInsets.all(20),
                    errorCorrectionLevel: QrErrorCorrectLevel.H,
                    data: context.watch<UserModel>().claveMaestro,
                    embeddedImageStyle: const QrEmbeddedImageStyle(
                      size: Size(120, 90),
                    ),
                    semanticsLabel: context.watch<UserModel>().claveMaestro,
                    embeddedImageEmitsError: true,
                    size: 200,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: relacionCredentialCardAspecto12 * 0.9,
              decoration: BoxDecoration(
                border: Border.merge(
                  const Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(0, 254, 254, 255),
                    ),
                  ),
                  const Border(
                    top: BorderSide(
                      color: Color.fromARGB(255, 208, 223, 156),
                      width: 3,
                    ),
                  ),
                ),
              ),
              child: const Flex(
                direction: Axis.vertical,
                children: <Text>[
                  Text(
                    'DIRECCION DEL PLANTEL',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                  Text(
                    'Fernando Hernández Carrasco S/N, Santa María Yancuitlalpan, 90500 Huamantla, Tlax.',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
