import 'package:flutter/material.dart';
import 'package:maestros/src/services/auth.dart';
import 'package:provider/provider.dart';

// Esta clase está definida para mostrar en la pantalla de register_class_attendance
// un listado de los alumnos matriculados en la clase.
class StudentListAttendance with ChangeNotifier {
  List _studentList = [];

  List get studentList => _studentList;

  set studentList(List value) {
    _studentList = value;
  }

  // Método para obtener la lista de estudiantes según la especialidad, grupo y semestre
  void getStudentsList(BuildContext context, String especialidad, String grupo,
      String semestre) {
    try {
      context
          .read<AuthService>()
          .db
          .collection('Alumnos')
          .where('Especialidad', isEqualTo: especialidad)
          .where('Grupo', isEqualTo: grupo)
          .where('Semestre', isEqualTo: semestre)
          .snapshots()
          .listen((event) {
        // Limpiar la lista de estudiantes antes de agregar nuevos estudiantes
        _studentList.clear();
        // Iterar sobre los documentos recibidos y agregar los estudiantes a la lista
        event.docs.forEach((doc) {
          _studentList.add(doc.data());
        });
        // Notificar a los escuchadores que la lista de estudiantes ha sido actualizada
        notifyListeners();
      });
    } catch (e) {
      // Manejar la excepción e imprimir un mensaje de error
      print('Error al obtener la lista de estudiantes: $e');
    }
  }
}
