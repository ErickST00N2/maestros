import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:maestros/src/providers/student_form_provider.dart';
import 'package:maestros/src/util/colores.dart';
import 'package:maestros/src/layouts/widgets/util/showSnackBar.dart';
import 'package:provider/provider.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class RegisterAttendanceQrScanner extends StatelessWidget {
  RegisterAttendanceQrScanner({super.key});
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.qr_code_scanner),
      label: const AutoSizeText(
        'Scanear Código QR',
        maxLines: 1,
      ),
      autofocus: true,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColoresApp().colorAppBar,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
          context: context,
          onCode: (code) {
            try {
              int numControl = int.parse(code.toString());
              context.read<StudentForm>().setStudent(numControl).whenComplete(
                  () => ShowSnackBar(context: context).showSnackBarMessage(
                      true, 'Asistencia registrada correctamente'));
            } catch (e) {
              ShowSnackBar(context: context).showSnackBarMessage(false,
                  'No se puede registrar la asistencia del alumno. Error: $e');
              debugPrint("Este es el catch del qr scanner dialog$e");
            }
          },
        );
      },
    );
  }
}
