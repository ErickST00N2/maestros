// ignore_for_file: use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:maestros/src/layouts/util/colores.dart';
import 'package:maestros/src/layouts/widgets/util/show_snack_bar.dart';
import 'package:maestros/src/providers/register_class_attendance/provider_register_class_attendance.dart';
import 'package:maestros/src/util/extrar_id.dart';
import 'package:provider/provider.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

/// Widget para escanear códigos QR y registrar la asistencia del estudiante.
class RegisterAttendanceQrScanner extends StatelessWidget {
  /// Constructor de la clase.
  RegisterAttendanceQrScanner({super.key});

  /// Instancia del plugin para escanear códigos QR.
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();

  /// Método build para construir el widget.
  @override
  Widget build(BuildContext context) {
    // Condición para habilitar/deshabilitar el botón de escaneo.
    final conditionBTN = context.watch<RegisterClassAttendance>().status ==
            FormStateRegisterClassAttendance.ERROR ||
        context.watch<RegisterClassAttendance>().status ==
            FormStateRegisterClassAttendance.ENDED;

    return TextButton.icon(
      icon: const Icon(Icons.qr_code_scanner),
      label: conditionBTN
          ? const AutoSizeText(
              'Scanear Código QR',
              maxLines: 1,
            )
          : const CircularProgressIndicator.adaptive(),
      autofocus: true,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColoresApp().colorAppBar,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        foregroundColor: Colors.white,
      ),
      onPressed: () => _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
        context: context,
        onCode: (code) async {
          try {
            // Extrae el número de control del código QR escaneado.
            final numControl = int.parse(extraerId(code!));
            // Registra la asistencia del estudiante.
            await context
                .read<RegisterClassAttendance>()
                .registerAttendanceStudent(numControl)
                .whenComplete(
                  () => ShowSnackBar(context: context).showSnackBarMessage(
                    isSuccess: true,
                    message: 'Asistencia registrada correctamente',
                  ),
                );
          } catch (e) {
            // Manejo de errores en caso de falla al registrar la asistencia.
            ShowSnackBar(context: context).showSnackBarMessage(
              isSuccess: false,
              message:
                  'No se puede registrar la asistencia del alumno. Error: $e',
            );
            debugPrint('Este es el catch del qr scanner dialog$e');
          }
        },
      ),
    );
  }
}
