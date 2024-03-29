import 'package:flutter/material.dart';
import 'package:maestros/src/providers/student_form_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class QrBarCodeScannerDialogView extends StatelessWidget {
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();

  QrBarCodeScannerDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Material(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                context: context,
                onCode: (code) {
                  try {
                    int numControl = int.parse(code.toString());
                    context
                        .read<StudentForm>()
                        .setStudent(numControl)
                        .whenComplete(() => showSnackBar(context, true));
                  } catch (e) {
                    showSnackBar(context, false);
                    debugPrint("Este es el catch del qr scanner dialog$e");
                  }
                },
              );
            },
            child: const Text('Scanear Código QR'),
          ),
        ),
      );
    });
  }

  /// Muestra un snackbar con un mensaje indicando que se encontró un alumno.
  ///
  /// El parámetro [context] es el contexto de construcción del widget.
  /// El parámetro [code] es el código que se escaneó.
  void showSnackBar(BuildContext context, bool result) {
    // Crea un widget SnackBar con un color de fondo verde azulado y un mensaje
    // indicando que se encontró un alumno.
    SnackBar snackBar = SnackBar(
      backgroundColor: result ? Colors.teal : Colors.red,
      content: Text(result ? 'Alumno encontrado' : 'No se encontro el alumno'),
    );

    // Muestra el SnackBar usando ScaffoldMessenger.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
