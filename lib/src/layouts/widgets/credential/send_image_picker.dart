import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maestros/src/services/auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

/// El widget `SendImagePicker` muestra un botón para seleccionar una imagen de
///  la galería.
class SendImagePicker extends StatelessWidget {
  /// Constructor de `SendImagePicker`.
  ///
  /// [key] es una llave para identificar de manera única este widget.
  SendImagePicker({super.key});

  /// Instancia de [ImagePicker] para acceder a la galería.
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

  /// Método para manejar la acción de seleccionar una imagen de la galería.
  Future<void> onSubmitGalleryPhoto(BuildContext context) async {
    try {
      // Selecciona una imagen de la galería
      final image = await _picker.pickImage(
        source: ImageSource.gallery,
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
