import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maestros/src/services/auth.dart';
import 'package:path_provider/path_provider.dart';

import 'package:provider/provider.dart';

/// El widget `CameraCredential` muestra un botón para tomar una foto con la
/// cámara.
class CameraCredential extends StatelessWidget {
  /// Constructor de `CameraCredential`.
  ///
  /// [key] es una llave para identificar de manera única este widget.
  CameraCredential({super.key});

  /// Instancia de [ImagePicker] para acceder a la cámara.
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => onSubmitCameraPhoto(context),
      icon: const Icon(Icons.camera),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 2,
        minimumSize: const Size(120, 50),
      ),
      label: const Text('Tomar Foto'),
    );
  }

  /// Método para manejar la acción de tomar una foto con la cámara.
  Future<void> onSubmitCameraPhoto(BuildContext context) async {
    try {
      // Toma una foto con la cámara frontal
      final image = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 50,
      );

      // Si no se selecciona ninguna imagen, se sale del método
      if (image == null) return;

      // Obtiene el archivo de la imagen
      final file = File(image.path);

      // Define el nuevo nombre del archivo
      const newFileName = 'fotoP.jpg';

      // Obtiene el directorio temporal del dispositivo
      final tempDir = await getTemporaryDirectory();

      // Crea un nuevo archivo con el nuevo nombre en el directorio temporal
      final newFile = File('${tempDir.path}/$newFileName');

      // Copia el contenido del archivo original al nuevo archivo
      await file.copy(newFile.path);

      // Sube el nuevo archivo a Firebase Storage
      // ignore: use_build_context_synchronously
      final authService = context.read<AuthService>();
      await FirebaseStorage.instance
          .ref(
            'maestros/photoURL/${authService.firebaseUser!.uid}/$newFileName',
          )
          .putFile(newFile);

      debugPrint('Imagen subida con éxito');
    } on FirebaseException catch (e) {
      debugPrint('La imagen no se pudo subir: ${e.message}');
    }
  }
}
