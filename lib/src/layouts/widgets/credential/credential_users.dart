import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:maestros/src/layouts/widgets/credential/camera_credential.dart';
import 'package:maestros/src/layouts/widgets/credential/credential_back.dart';
import 'package:maestros/src/layouts/widgets/credential/credential_front.dart';
import 'package:maestros/src/layouts/widgets/credential/send_image_picker.dart';
import 'package:maestros/src/providers/user.dart';
import 'package:maestros/src/services/auth.dart';
import 'package:provider/provider.dart';

///@ErickST00N
/// [buildDataTeacherContent] En la función buildDataTeacherContent es la
/// CredentialCard
/// que se muestra en la pantalla.
/// Esta card es la responsable de unir los contenidos de los dos widget back y
/// front.
/// [context] - recibe el contexto de la aplicación cuando se llama a esta
/// funcion.

///[controllerGestureFlipCardCredential] - El controlador de la card.
///La card es flippable.
Widget buildDataTeacherContent(
  BuildContext context,
  GestureFlipCardController controllerGestureFlipCardCredential,
) {
  const pi = math.pi;
  context
      .read<UserModel>()
      .getUserData(context.watch<AuthService>().firebaseUser);
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Center(
        child: SizedBox(
          width: 600,
          child: GestureFlipCard(
            controller: controllerGestureFlipCardCredential,
            enableController: true,
            animationDuration: const Duration(milliseconds: 1800),
            frontWidget: buildCardFront(context: context, pi: pi),
            backWidget: buildCardBack(context: context, pi: pi),
          ),
        ),
      ),
      Row(
        children: [
          const Expanded(
            child: SizedBox(width: 20),
          ),
          Expanded(
            flex: 3,
            child: TextButton.icon(
              icon: const Icon(Icons.flip_to_back),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 2,
                minimumSize: const Size(120, 50),
              ),
              label: const Text('Voltear Credencial'),
              onPressed: () {
                // Flip the card programmatically

                controllerGestureFlipCardCredential.flipcard();
              },
            ),
          ),
          const Expanded(
            child: SizedBox(width: 20),
          ),
          Expanded(
            flex: 3,
            child: CameraCredential(),
          ),
          const Expanded(
            child: SizedBox(width: 20),
          ),
        ],
      ),
      Center(
        child: SendImagePicker(),
      ),
    ],
  );
}
