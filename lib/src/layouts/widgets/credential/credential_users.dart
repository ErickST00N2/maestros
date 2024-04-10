import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:maestros/src/layouts/widgets/credential/camera_credential.dart';
import 'package:maestros/src/layouts/widgets/credential/credential_back.dart';
import 'package:maestros/src/layouts/widgets/credential/credential_front.dart';
import 'package:maestros/src/layouts/widgets/credential/send_image_picker.dart';

///@ErickST00N
///[buildDataTeacherContent] En la función buildDataTeacherContent es la CredentialCard
///que se muestra en la pantalla.
///Esta card es la responsable de unir los contenidos de los dos widget back y front.
///[context] - recibe el contexto de la aplicación cuando se llama a esta funcion.

///[databaseUser] - Los datos del usuario almacenados en la base de datos.
///[controllerGestureFlipCardCredential] - El controlador de la card.
///La card es flippable.
Widget buildDataTeacherContent(BuildContext context, databaseUser,
    GestureFlipCardController controllerGestureFlipCardCredential) {
  const double pi = math.pi;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Center(
        child: SizedBox(
          width: 600,
          child: GestureFlipCard(
            controller: controllerGestureFlipCardCredential,
            axis: FlipAxis.vertical,
            enableController: true,
            animationDuration: const Duration(milliseconds: 1800),
            frontWidget: buildCardFront(context, databaseUser, pi),
            backWidget: buildCardBack(context, databaseUser, pi),
          ),
        ),
      ),
      Row(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(width: 20),
          ),
          Expanded(
            flex: 3,
            child: TextButton.icon(
              icon: const Icon(Icons.flip_to_back),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 2,
                  minimumSize: const Size(120, 50)),
              label: const Text('Voltear Credencial'),
              onPressed: () {
                // Flip the card programmatically

                controllerGestureFlipCardCredential.flipcard();
              },
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(width: 20),
          ),
          Expanded(
            flex: 3,
            child: CameraCredential(),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(width: 20),
          ),
        ],
      ),
      Center(
        child: SendImagePicker(),
      )
    ],
  );
}
