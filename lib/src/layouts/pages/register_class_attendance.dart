import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:maestros/src/layouts/widgets/menu/menu_lateral.dart';
import 'package:maestros/src/layouts/widgets/register_class_attendance/form_register_class_attendance/form_register_class_attendance.dart';
import 'package:maestros/src/layouts/widgets/register_class_attendance/register_attendance_qr_scanner/register_attendance_qr_scanner.dart';
import 'package:maestros/src/layouts/util/colores.dart';

class RegisterClassAttendance extends StatefulWidget {
  const RegisterClassAttendance({super.key});

  @override
  State<RegisterClassAttendance> createState() =>
      _RegisterClassAttendanceState();
}

class _RegisterClassAttendanceState extends State<RegisterClassAttendance> {
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
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SizedBox(
              width: 900,
              child: Column(
                children: [
                  //Escanear Código QR para registrar asistencia
                  const AutoSizeText(
                    'Escanea el Código QR para registrar la asistencia.',
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.justify,
                    minFontSize: 10,
                    maxLines: 1,
                    maxFontSize: 30,
                  ),
                  const SizedBox(height: 20),
                  RegisterAttendanceQrScanner(),

                  //Formulario de asistencia
                  const SizedBox(height: 20),
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  const AutoSizeText(
                    'o',
                    style: TextStyle(fontSize: 13),
                    minFontSize: 8,
                    maxLines: 1,
                    maxFontSize: 18,
                  ),
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const AutoSizeText(
                    'Rellena los campos para registrar la asistencia mediante un' +
                        ' listado de los alumnos matriculados en la clase.',
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.justify,
                    minFontSize: 10,
                    maxLines: 4,
                    maxFontSize: 30,
                  ),
                  const SizedBox(height: 20),

                  FormRegisterClassAttendance(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
