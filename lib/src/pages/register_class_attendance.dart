import 'package:flutter/material.dart';
import 'package:maestros/src/providers/student_form_provider.dart';
import 'package:maestros/src/util/colores.dart';
import 'package:maestros/src/widgets/menu/menu_lateral.dart';
import 'package:maestros/src/widgets/showSnackBar.dart';
import 'package:provider/provider.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class RegisterClassAttendance extends StatelessWidget {
  RegisterClassAttendance({super.key});
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  final ColoresApp cAplication = ColoresApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Asistencia de Clase",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: cAplication.colorDelAppBar,
      ),
      body: SingleChildScrollView(
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
                      .whenComplete(() => ShowSnackBar(context: context)
                          .showSnackBarMessage(
                              true, 'Asistencia registrada correctamente'));
                } catch (e) {
                  ShowSnackBar(context: context).showSnackBarMessage(false,
                      'No se puede registrar la asistencia del alumno. Error: $e');
                  debugPrint("Este es el catch del qr scanner dialog$e");
                }
              },
            );
          },
          child: const Text('Scanear Código QR'),
        )),
      ),
    );
  }
}
