import 'package:flutter/material.dart';
import 'package:maestros/src/providers/student_form_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

/// Vista para escanear un código QR y mostrar el resultado.
class QrBarCodeScannerDialogView extends StatelessWidget {
  /// Constructor de la clase.
  QrBarCodeScannerDialogView({super.key});

  /// Instancia del plugin para escanear códigos QR.
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();

  /// Método build para construir el widget.
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Material(
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                  context: context,
                  onCode: (code) {
                    try {
                      final numControl = int.parse(code.toString());
                      // Establece el estudiante utilizando el número de
                      // control.
                      context
                          .read<StudentForm>()
                          .setStudent(numControl)
                          .whenComplete(
                            () => showSnackBar(result: true, context: context),
                          );
                    } catch (e) {
                      // Muestra un SnackBar en caso de error.
                      showSnackBar(result: true, context: context);
                      debugPrint('Este es el catch del qr scanner dialog$e');
                    }
                  },
                );
              },
              child: const Text('Scanear Código QR'),
            ),
          ),
        );
      },
    );
  }

  /// Muestra un snackbar con un mensaje indicando el resultado del escaneo.
  ///
  /// El parámetro [context] es el contexto de construcción del widget.
  /// El parámetro [result] indica si se encontró el alumno o no.
  void showSnackBar({required BuildContext context, required bool result}) {
    // Crea un widget SnackBar con un color de fondo verde azulado y un mensaje
    // indicando el resultado del escaneo.
    final snackBar = SnackBar(
      backgroundColor: result ? Colors.teal : Colors.red,
      content: Text(result ? 'Alumno encontrado' : 'No se encontró el alumno'),
    );

    // Muestra el SnackBar utilizando ScaffoldMessenger.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
