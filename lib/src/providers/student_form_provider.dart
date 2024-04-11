import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:maestros/src/services/auth.dart';

/// ```StudentForm``` - Es una clase definida para mostrar en la pantalla de
/// inicio.
class StudentForm with ChangeNotifier {
  /// ```StudentForm``` - Es el construcor de la clase definida para mostrar en
  /// la pantalla de inicio.
  factory StudentForm() {
    return _instance;
  }

  StudentForm._private();
  static final StudentForm _instance = StudentForm._private();
  String _numControl = '';

  String _nombre = '';
  String _semestre = '';
  String _grupo = '';

  String _especialidad = '';
  String _asignatura = '';

  var _incidencia = <String>[];

  String _comentarios = '';

  DateTime _dateReport = DateTime.now();

  /// ```dataReport``` es el getter de la variabla
  /// [_dateReport]
  DateTime get dateReport => _dateReport;

  set dateReport(DateTime value) {
    _dateReport = value;
    notifyListeners();
  }

  /// [_comentarios] La variable es privada y es la encargada en almacenar los
  /// comentarios del maestro.
  /// Pero para obtenerlo usamos el Getter:
  /// ```comentarios```
  String get comentarios => _comentarios;

  set comentarios(String value) {
    _comentarios = value;
    notifyListeners();
    debugPrint('Comentarios actualizados correctamente $comentarios');
  }

  /// [_incidencia] La variable es privada y es la encargada en almacenar las
  /// incidencias del maestro.
  /// Pero para obtenerlo usamos el Getter:
  /// ```incidencia```
  List<String> get incidencia => _incidencia;

  set incidencia(List<String> value) {
    _incidencia
      ..clear()
      ..addAll(value as Iterable<String>);
    debugPrint('Lista de incidencias actualizada correctamente $incidencia');
    notifyListeners();
  }

  Map<String, dynamic> _studentData = {};

  /// [```studentData```] es el getter de la variable [_studentData]
  /// ```_studentData```
  Map<String, dynamic> get studentData => _studentData;

  set studentData(Map<String, dynamic> value) {
    _studentData = value;
    notifyListeners();
  }

  /// Devuelve la asignatura del estudiante.
  String get asignatura => _asignatura;

  /// Devuelve la especialidad del estudiante.
  String get especialidad => _especialidad;

  /// Devuelve el grupo al que pertenece el estudiante.
  String get grupo => _grupo;

  /// Devuelve el nombre del estudiante.
  String get nombre => _nombre;

  /// Devuelve el número de control del estudiante.
  String get numControl => _numControl;

  /// Devuelve el semestre en el que se encuentra el estudiante.
  String get semestre => _semestre;

  set numControl(String newValue) {
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

  /// Carga los datos del estudiante para mostrarlos en la pantalla de inicio.
  Future<bool> setStudent(int numControl) async {
    try {
      final authService = AuthService();
      // Obtiene una referencia a la colección 'Alumnos' de Firebase Firestore.
      final CollectionReference collectionReferenceAlumno =
          authService.db.collection('Alumnos');

      // Realiza la consulta a la colección 'Alumnos' buscando al estudiante por
      // número de control.
      final querySnapshotAlumno = await collectionReferenceAlumno
          .where('NumControl', isEqualTo: numControl)
          .get();

      // Verifica si se encontró algún estudiante con ese número de control.
      if (querySnapshotAlumno.docs.isEmpty) {
        // No se encontró ningún estudiante, devuelve false.
        return false;
      }

      // Se encontró al menos un estudiante, actualiza los datos del estudiante
      // y devuelve true.
      final element = querySnapshotAlumno.docs[0];

      _numControl = element['NumControl'] as String;
      _nombre = element['Nombre'] as String;
      _semestre = element['Semestre'] as String;
      _grupo = element['Grupo'] as String;
      _especialidad = element['Especialidad'] as String;

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

  /// Limpia los datos del formulario.
  Future<void> clear() async {
    _numControl = '';
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
