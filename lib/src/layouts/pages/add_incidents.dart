// ignore_for_file: use_build_context_synchronously, comment_references

import 'package:flutter/material.dart';
import 'package:maestros/src/layouts/util/colores.dart';
import 'package:maestros/src/layouts/widgets/add_incidents/add_incidents_form.dart';
import 'package:maestros/src/layouts/widgets/menu/menu_lateral.dart';
import 'package:maestros/src/layouts/widgets/util/show_snack_bar.dart';
import 'package:maestros/src/providers/student_form_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

/// Widget para mostrar la pantalla de añadir incidencias.
class AddIncidents extends StatelessWidget {
  /// Constructor de la clase AddIncidents.
  AddIncidents({super.key});

  ///Colores de la aplicación ```ColoresApp```
  final ColoresApp cAplication = ColoresApp();

  ///Instancia del plugin para escanear códigos QR
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();

  @override
  Widget build(BuildContext context) {
    const alumnoEncontrado = 'Alumno encontrado';
    const alumnoNoEncontrado = 'Alumno no encontrado';
    final sSB = ShowSnackBar(context: context);
    return Scaffold(
      appBar: AppBar(
        // AppBar con el título "Añadir Incidencias" y un color de fondo
        // turquesa
        title: const Text(
          'Añadir Incidencias',
          style: TextStyle(
            fontFamily: AutofillHints.addressCity,
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromRGBO(2, 169, 218, 1),
      ),
      body: SingleChildScrollView(child: _formContainer(context)),
      drawer: const MenuLateral(),
      floatingActionButton: IconButton(
        // FloatingActionButton con un IconButton y un icono qr_code_2_outlined
        icon: const Icon(Icons.qr_code_2_outlined),
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Color(cAplication.medio)),
        ),
        color: Colors.white,
        tooltip: 'Añadir Incidencia con Código QR',
        iconSize: 40,
        onPressed: () {
          _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
            context: context,
            onCode: (code) {
              Future.microtask(() async {
                try {
                  await context
                      .read<StudentForm>()
                      .setStudent(int.parse(code.toString()))
                      .then(
                    (value) => sSB.showSnackBarMessage(
                      isSuccess: true,
                      message: alumnoEncontrado,
                    ),
                    // ignore: inference_failure_on_untyped_parameter
                    onError: (error) {
                      sSB.showSnackBarMessage(
                        isSuccess: false,
                        message: alumnoNoEncontrado,
                      );
                      debugPrint('El error es: $error');
                    },
                  );
                } catch (e) {
                  sSB.showSnackBarMessage(
                    isSuccess: false,
                    message: alumnoNoEncontrado,
                  );
                  debugPrint('Este es el catch del qr scanner dialog$e');
                }
              });
            },
          );
        },
      ),
    );
  }

  /// Retorna un widget [Card] que contiene un widget [Padding] que contiene un
  /// [ValueListenableBuilder].
  ///
  /// El [ValueListenableBuilder] se utiliza para actualizar la interfaz de
  /// usuario cuando el valor de [_qrcodeNotifier] cambia.
  ///
  /// El widget [FormViewAddIncidents] se muestra dentro del
  /// [ValueListenableBuilder] y recibe el valor actual de [_qrcodeNotifier]
  /// como parámetro.
  ///
  /// El parámetro [context] es el contexto de construcción del widget.
  Widget _formContainer(BuildContext context) {
    // El widget Card representa una caja que tiene un efecto de sombra.
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 900,
          child: Card(
            child: Padding(
              // El widget Padding agrega relleno a su widget hijo.
              padding: const EdgeInsets.all(6),
              child: FormViewAddIncidents(),
            ),
          ),
        ),
      ),
    );
  }
}
