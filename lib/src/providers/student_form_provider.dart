import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:maestros/src/services/auth.dart';

class StudentForm with ChangeNotifier {
  static final StudentForm _instance = StudentForm._private();
  int _numControl = 0;

  String _nombre = '';
  String _semestre = '';
  String _grupo = '';

  String _especialidad = '';
  String _asignatura = '';

  List _incidencia = [];

  String _comentarios = '';

  DateTime _dateReport = DateTime.now();

  DateTime get dateReport => _dateReport;

  set dateReport(DateTime value) {
    _dateReport = value;
    notifyListeners();
  }

  String get comentarios => _comentarios;

  set comentarios(String value) {
    _comentarios = value;
    notifyListeners();
    debugPrint('Comentarios actualizados correctamente $comentarios');
  }

  List get incidencia => _incidencia;

  set incidencia(List value) {
    _incidencia.clear();
    _incidencia.addAll(value);
    debugPrint('Lista de incidencias actualizada correctamente $incidencia');
    notifyListeners();
  }

  Map<String, dynamic> _studentData = {};

  Map<String, dynamic> get studentData => _studentData;

  set studentData(Map<String, dynamic> value) {
    _studentData = value;
    notifyListeners();
  }

  factory StudentForm() {
    return _instance;
  }
  StudentForm._private();

  String get asignatura => _asignatura;

  String get especialidad => _especialidad;

  String get grupo => _grupo;

  String get nombre => _nombre;

  int get numControl => _numControl;

  String get semestre => _semestre;

  set numControl(int newValue) {
    _numControl = newValue;
    notifyListeners();
  }

  set nombre(String newValue) {
    _nombre = newValue;
    notifyListeners();
  }

  set semestre(String newValue) {
    _semestre = newValue;
    notifyListeners();
  }

  set grupo(String newValue) {
    _grupo = newValue;
    notifyListeners();
  }

  set especialidad(String newValue) {
    _especialidad = newValue;
    notifyListeners();
  }

  set asignatura(String newValue) {
    _asignatura = newValue;
    notifyListeners();
  }

  Future<bool> setStudent(int numControl) async {
    try {
      final authService = AuthService();
      // Obtiene una referencia a la colección 'Alumnos' de Firebase Firestore.
      CollectionReference collectionReferenceAlumno =
          authService.db.collection("Alumnos");

      // Realiza la consulta a la colección 'Alumnos' buscando al estudiante por
      // número de control.
      QuerySnapshot querySnapshotAlumno = await collectionReferenceAlumno
          .where('NumControl', isEqualTo: numControl)
          .get();

      // Verifica si se encontró algún estudiante con ese número de control.
      if (querySnapshotAlumno.docs.isEmpty) {
        // No se encontró ningún estudiante, devuelve false.
        return false;
      }

      // Se encontró al menos un estudiante, actualiza los datos del estudiante
      // y devuelve true.
      QueryDocumentSnapshot element = querySnapshotAlumno.docs[0];

      _numControl = element['NumControl'];
      _nombre = element['Nombre'];
      _semestre = element['Semestre'];
      _grupo = element['Grupo'];
      _especialidad = element['Especialidad'];

      debugPrint('el elemento es:$element');
      notifyListeners();

      return true;
    } catch (error) {
      // Maneja la excepción e imprime el mensaje de error.
      debugPrint('Error al obtener el estudiante: $error');
      // Devuelve false para indicar que ocurrió un error.
      return false;
    }
  }

  Future clear() async {
    _numControl = 0;
    _nombre = '';
    _semestre = '';
    _grupo = '';
    _especialidad = '';
    _asignatura = '';
    _incidencia = [];
    _comentarios = '';
    _dateReport = DateTime.now();

    notifyListeners();
  }
}
