import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:maestros/src/widgets/credential/credential_back.dart';
import 'package:maestros/src/widgets/credential/credential_front.dart';

///@ErickST00N
///@lexisdez@gmail.com
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

  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(
          child: GestureFlipCard(
            controller: controllerGestureFlipCardCredential,
            axis: FlipAxis.vertical,
            enableController: true,
            animationDuration: const Duration(milliseconds: 1800),
            frontWidget: buildCardFront(context, databaseUser, pi),
            backWidget: buildCardBack(context, databaseUser, pi),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 2,
              minimumSize: const Size(120, 50)),
          child: const Text('Flip Card'),
          onPressed: () {
            // Flip the card programmatically

            controllerGestureFlipCardCredential.flipcard();
          },
        ),
      ],
    ),
  );
}
