import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maestros/src/providers/user.dart';
import 'package:maestros/src/services/auth.dart';

enum FormStateRegisterClassAttendance {
  ENDED,
  LOADING,
  ERROR,
}

class ProviderRegisterClassAttendance extends ChangeNotifier {
  FormStateRegisterClassAttendance status =
      FormStateRegisterClassAttendance.ENDED;

  /// Obtiene la lista de alumnos que seran registradas sus asistencias en la clase.
  List _studentsRegisterClass = [];

  /// Obtiene la lista de alumnos que seran registradas sus asistencias en la clase.
  List get studentsRegisterClass => _studentsRegisterClass;

  /// Obtiene la lista de alumnos que seran registradas sus asistencias en la clase.
  set studentsRegisterClass(List value) {
    _studentsRegisterClass.clear();
    _studentsRegisterClass = value;
    notifyListeners();
    debugPrint(
        'Los estudiantes seleccionados son:${_studentsRegisterClass.toList().toString()}');
  }

  /// Obtiene la lista de alumnos en la clase.
  List _students = [];

  List get students => _students;

  set students(List value) {
    _students.clear();
    _students = value;
    notifyListeners();
  }

  String _semestre = '1';
  String _grupo = 'A';
  String _especialidad = 'Programación';

  String get especialidad => _especialidad;
  String get grupo => _grupo;
  String get semestre => _semestre;

  set grupo(String value) {
    if (value.isNotEmpty) {
      _grupo = value;
      getStudents();
      notifyListeners();
    }
  }

  set semestre(String value) {
    if (value.isNotEmpty) {
      _semestre = value;
      getStudents();
      notifyListeners();
    }
  }

  set especialidad(String value) {
    if (value.isNotEmpty) {
      _especialidad = value;
      getStudents();
      notifyListeners();
    }
  }

  Future<bool> getStudents() async {
    status = FormStateRegisterClassAttendance.LOADING;
    try {
      QuerySnapshot value = await AuthService()
          .db
          .collection("Alumnos")
          .where("Semestre", isEqualTo: semestre)
          .where("Grupo", isEqualTo: grupo)
          .where("Especialidad", isEqualTo: especialidad)
          .get();

      students = value.docs;
      status = FormStateRegisterClassAttendance.ENDED;
      debugPrint('Los estudiantes son: ${students.toList().toString()}');
      return true;
    } catch (e) {
      status = FormStateRegisterClassAttendance.ERROR;
      return false;
    }
  }

  Future<bool> submitStudentsAt() async {
    status = FormStateRegisterClassAttendance.LOADING;
    try {
      RegisterClassAttendance rCAS = RegisterClassAttendance();
      studentsRegisterClass.map((item) async {
        await rCAS.registerAttendanceStudent(item['NumControl']);
      }).toList();
      clear();
      status = FormStateRegisterClassAttendance.ENDED;
      return true;
    } catch (e) {
      status = FormStateRegisterClassAttendance.ERROR;
      debugPrint('El error es: ${e.toString()}');
      return false;
    }
  }

  void clear() {
    studentsRegisterClass.clear();
    students.clear();
    _semestre = '1';
    _grupo = 'A';
    _especialidad = 'Programación';
    notifyListeners();
  }
}

/// Clase para la registro de asistencia de una clase. Esta clase permite
/// registrar la asistencia de un estudiante a una clase. La clase utiliza el
/// patron Provider para notificar a los widgets que esten escuchando cuando
/// cambia el estado de registro de asistencia.
class RegisterClassAttendance with ChangeNotifier {
  /// Numero de control del estudiante.
  int _numControl = 0;

  /// Materia a la que asiste el estudiante.
  String _materia = 'LENGUA Y COMUNICACIÓN II';

  /// Estado del formulario de registro de asistencia.
  FormStateRegisterClassAttendance _status =
      FormStateRegisterClassAttendance.ENDED;

  /// Obtiene el numero de control del estudiante.
  ///
  /// Retorna el numero de control del estudiante.
  int get numControl => _numControl;

  /// Obtiene la materia a la que asiste el estudiante.
  ///
  /// Retorna la materia a la que asiste el estudiante.
  String get materia => _materia;

  /// Obtiene el estado del formulario de registro de asistencia.
  ///
  /// Retorna el estado del formulario de registro de asistencia.
  FormStateRegisterClassAttendance get status => _status;

  /// Establece el numero de control del estudiante.
  ///
  /// [value] es el nuevo valor del numero de control del estudiante.
  set numControl(int value) {
    _numControl = value;
    notifyListeners();
  }

  /// Establece la materia a la que asiste el estudiante.
  ///
  /// [value] es la nueva materia a la que asiste el estudiante.
  set materia(String value) {
    _materia = value;
    notifyListeners();
  }

  /// Establece el estado del formulario de registro de asistencia.
  ///
  /// [value] es el nuevo estado del formulario de registro de asistencia.
  set status(FormStateRegisterClassAttendance value) {
    _status = value;
    notifyListeners();
  }

  /// Registra la asistencia del estudiante a la clase.
  ///
  /// [numControl] es el numero de control del estudiante.
  ///
  /// Lanza una excepcion si ocurre algun error en el proceso de registro.
  Future registerAttendanceStudent(int numControl) async {
    try {
      // Cambia el estado del formulario a cargando
      status = FormStateRegisterClassAttendance.LOADING;
      // Obtiene la instancia del servicio de autenticación
      AuthService authService = AuthService();
      // Registra la asistencia del estudiante a la clase en la base de datos
      await authService.db.collection("AsistenciaClase").doc().set({
        'Maestros_idMaestros': Users().idMaestros,
        'classTime': DateTime.now(),
        'materia': materia,
        'numControl': numControl.toString(),
      });
      // Cambia el estado del formulario a finalizado
      status = FormStateRegisterClassAttendance.ENDED;
    } catch (e) {
      // Cambia el estado del formulario a error
      status = FormStateRegisterClassAttendance.ERROR;
    }
  }

  /// Registra la asistencia del estudiante a la clase.
  ///
  /// Esta funcion registra la asistencia del estudiante a la clase.
}
