import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maestros/src/services/auth.dart';
import 'package:path_provider/path_provider.dart';

import 'package:provider/provider.dart';

class CameraCredential extends StatelessWidget {
  CameraCredential({super.key});
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () => onSubmitCameraPhoto(context),
        icon: const Icon(Icons.camera),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 2,
            minimumSize: const Size(120, 50)),
        label: const Text('Tomar Foto'));
  }

  Future<void> onSubmitCameraPhoto(BuildContext context) async {
    //TODO: implement onPressed para tomar la foto en el cual cambiará la foto
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image == null) return;

    File file = File(image.path);
    // Define el nuevo nombre del archivo
    String newFileName = 'fotoP.jpg';
    // Obtiene el directorio temporal del dispositivo
    Directory tempDir = await getTemporaryDirectory();
    // Crea un nuevo archivo con el nuevo nombre en el directorio temporal
    File newFile = File('${tempDir.path}/$newFileName');
    // Copia el contenido del archivo original al nuevo archivo
    await file.copy(newFile.path);

    try {
      // Sube el nuevo archivo a Firebase Storage
      AuthService authService = context.read<AuthService>();
      await FirebaseStorage.instance
          .ref(
              'maestros/photoURL/${authService.firebaseUser!.uid}/$newFileName')
          .putFile(newFile);
      debugPrint('Imagen subida con éxito');
    } on FirebaseException catch (e) {
      debugPrint(e.message);
    }
  }
}
