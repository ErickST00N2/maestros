import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maestros/src/services/auth.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';

class SendImagePicker extends StatelessWidget {
  SendImagePicker({super.key});

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => onSubmitGalleryPhoto(context),
      icon: const Icon(Icons.photo_library),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 2,
        minimumSize: const Size(120, 50),
      ),
      label: const Text('Elegir Foto'),
    );
  }

  Future<void> onSubmitGalleryPhoto(BuildContext context) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

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
