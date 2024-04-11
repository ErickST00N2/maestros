import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maestros/src/providers/user.dart';
import 'package:maestros/src/services/auth.dart';

/// Enumeración que representa los diferentes estados del formulario de
/// registro de asistencia a clase.
enum FormStateRegisterClassAttendance {
  /// El formulario ha sido completado exitosamente.
  ENDED,

  /// El formulario aún no ha sido completado.
  LOADING,

  /// El formulario ha fallado.
  ERROR, // Error
}

/// Clase que proporciona el estado y funcionalidades para el registro de
/// asistencia a clase.
class ProviderRegisterClassAttendance extends ChangeNotifier {
  /// Estado del formulario de registro de asistencia a clase.
  FormStateRegisterClassAttendance _status =
      FormStateRegisterClassAttendance.ENDED;

  /// Obtiene el estado del formulario de registro de asistencia a clase.
  FormStateRegisterClassAttendance get status => _status;

  /// Establece el estado del formulario de registro de asistencia a clase.
  set status(FormStateRegisterClassAttendance value) {
    _status = value;
    notifyListeners();
  }

  /// Lista de alumnos que serán registrados en la asistencia a clase.
  var _studentsRegisterClass = <dynamic>[];

  /// Obtiene la lista de alumnos que serán registrados en la asistencia a
  /// clase.
  List<dynamic> get studentsRegisterClass => _studentsRegisterClass;

  /// Establece la lista de alumnos que serán registrados en la asistencia a
  /// clase.
  set studentsRegisterClass(List<dynamic> value) {
    _studentsRegisterClass.clear();
    _studentsRegisterClass = value;
    notifyListeners();
    debugPrint(
      'Los estudiantes seleccionados son:${_studentsRegisterClass.toList()}',
    );
  }

  /// Lista de alumnos en la clase.
  var _students = <dynamic>[];

  /// Obtiene la lista de alumnos en la clase.
  List<dynamic> get students => _students;

  /// Establece la lista de alumnos en la clase.
  set students(List<dynamic> value) {
    _students.clear();
    _students = value;
    notifyListeners();
  }

  /// Semestre de la clase.
  String _semestre = '1';

  /// Grupo de la clase.
  String _grupo = 'A';

  /// Especialidad de la clase.
  String _especialidad = 'Programación';

  /// Obtiene la especialidad de la clase.
  String get especialidad => _especialidad;

  /// Obtiene el grupo de la clase.
  String get grupo => _grupo;

  /// Obtiene el semestre de la clase.
  String get semestre => _semestre;

  /// Establece el grupo de la clase.
  set grupo(String value) {
    if (value.isNotEmpty) {
      _grupo = value;
      getStudents();
      notifyListeners();
    }
  }

  /// Establece el semestre de la clase.
  set semestre(String value) {
    if (value.isNotEmpty) {
      _semestre = value;
      getStudents();
      notifyListeners();
    }
  }

  /// Establece la especialidad de la clase.
  set especialidad(String value) {
    if (value.isNotEmpty) {
      _especialidad = value;
      getStudents();
      notifyListeners();
    }
  }

  /// Obtiene la lista de estudiantes de la clase.
  Future<bool> getStudents() async {
    status = FormStateRegisterClassAttendance.LOADING;
    try {
      final QuerySnapshot value = await AuthService()
          .db
          .collection('Alumnos')
          .where('Semestre', isEqualTo: semestre)
          .where('Grupo', isEqualTo: grupo)
          .where('Especialidad', isEqualTo: especialidad)
          .get();
      students = value.docs;
      status = FormStateRegisterClassAttendance.ENDED;
      debugPrint('Los estudiantes son: ${students.toList()}');
      return true;
    } catch (e) {
      status = FormStateRegisterClassAttendance.ERROR;
      return false;
    }
  }

  /// Envía la lista de estudiantes registrados en la asistencia a clase.
  Future<bool> submitStudentsAt() async {
    status = FormStateRegisterClassAttendance.LOADING;
    try {
      final rCAS = RegisterClassAttendance();
      studentsRegisterClass.map((item) async {
        await rCAS.registerAttendanceStudent(item['NumControl'] as int);
      }).toList();
      clear();
      status = FormStateRegisterClassAttendance.ENDED;
      return true;
    } catch (e) {
      status = FormStateRegisterClassAttendance.ERROR;
      debugPrint('El error es: $e');
      return false;
    }
  }

  /// Limpia los datos relacionados con el registro de asistencia a clase.
  void clear() {
    studentsRegisterClass.clear();
    students.clear();
    _semestre = '1';
    _grupo = 'A';
    _especialidad = 'Programación';
    notifyListeners();
  }
}

/// Clase para el registro de asistencia de una clase.
class RegisterClassAttendance with ChangeNotifier {
  /// Número de control del estudiante.
  int _numControl = 0;

  /// Materia a la que asiste el estudiante.
  String _materia = 'LENGUA Y COMUNICACIÓN II';

  /// Estado del formulario de registro de asistencia.
  FormStateRegisterClassAttendance _status =
      FormStateRegisterClassAttendance.ENDED;

  /// Obtiene el número de control del estudiante.
  int get numControl => _numControl;

  /// Obtiene la materia a la que asiste el estudiante.
  String get materia => _materia;

  /// Obtiene el estado del formulario de registro de asistencia.
  FormStateRegisterClassAttendance get status => _status;

  /// Establece el número de control del estudiante.
  set numControl(int value) {
    _numControl = value;
    notifyListeners();
  }

  /// Establece la materia a la que asiste el estudiante.
  set materia(String value) {
    _materia = value;
    notifyListeners();
  }

  /// Establece el estado del formulario de registro de asistencia.
  set status(FormStateRegisterClassAttendance value) {
    _status = value;
    notifyListeners();
  }

  /// Registra la asistencia del estudiante a la clase.
  ///
  /// [numControl] es el número de control del estudiante.
  ///
  /// Lanza una excepción si ocurre algún error en el proceso de registro.
  Future<void> registerAttendanceStudent(int numControl) async {
    try {
      status = FormStateRegisterClassAttendance.LOADING;
      final authService = AuthService();
      await authService.db.collection('AsistenciaClase').doc().set({
        'Maestros_idMaestros': UserModel().idMaestros,
        'classTime': DateTime.now(),
        'materia': materia,
        'numControl': numControl.toString(),
      });
      status = FormStateRegisterClassAttendance.ENDED;
    } catch (e) {
      status = FormStateRegisterClassAttendance.ERROR;
    }
  }
}
