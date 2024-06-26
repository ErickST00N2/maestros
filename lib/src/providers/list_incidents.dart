import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maestros/src/providers/user.dart';
import 'package:maestros/src/services/auth.dart';

import 'package:provider/provider.dart';

class ListIncidents with ChangeNotifier {
  ListIncidents._private();

  static final ListIncidents _instance = ListIncidents._private();

  factory ListIncidents() {
    //setIncidents(getReportes(BuildContext context, db));
    return _instance;
  }

  final List<dynamic> _incidents = [];

  ///Lista de incidencias a la que se le pueden hacer todas las operaciones.
  ///Por ejemplo, se puede agregar, editar o eliminar incidencias de esta lista.
  get incidents => _incidents;

  ///Setea la lista de incidencias, eliminando la lista anterior y agregando la nueva.
  set incidents(value) {
    _incidents.clear();
    _incidents.addAll(value);
    debugPrint('Lista de incidencias actualizada correctamente $incidents');
    notifyListeners();
  }

  int _sizeListIncidents = 0;

  ///Obtiene el tamaño de la lista de incidencias.
  get sizeListIncidents => _sizeListIncidents;

  ///Setea el tamaño de la lista de incidencias.
  set setSizeListIncidents(value) {
    _sizeListIncidents = value;
    notifyListeners();
  }

  ///Carga una lista de incidencias desde Firestore en la lista de incidencias.
  Future setIncidents(Future<List<DocumentSnapshot>> data) async {
    incidents = await data;
    // Use `notifyListeners` only once, instead of in every iteration.
    notifyListeners();
  }

  ///Carga una lista de incidencias desde Firestore en la lista de incidencias.
  ///Se utiliza en el widget de la lista de incidencias.
  Future<List<DocumentSnapshot>> getReportes(BuildContext context) async {
    // Verificar si maestroOfGetReportes no es nulo antes de usarlo
    // Obtener los datos del maestro
    // Llama al método getMaestroData del maestro para obtener los datos.

    // Imprimir el id del maestro
    debugPrint('El id es:${context.watch<Users>().idMaestros}');

    // Realizar una consulta en la colección "Reporte" para obtener los reportes
    // del maestro especificado.
    QuerySnapshot queryReporte = await context
        .watch<AuthService>()
        .db
        .collection("Reporte")
        .where("Maestros_idMaestros",
            isEqualTo: context.watch<Users>().idMaestros)
        .get();
    setSizeListIncidents = queryReporte.docs.length;
    // Imprimir el primer nombre de alumno en el primer documento de la consulta.
    debugPrint('La consulta es:${queryReporte.docs.length}');
    incidents = queryReporte.docs;
    notifyListeners();
    // Devolver los documentos de la consulta.
    return queryReporte.docs;
  }

  ///Agrega una lista de incidencias a Firestore.
  ///Se utiliza en el widget de agregar incidencias.
  // Dentro de la clase ListIncidents
  Future<bool> addIncidents(List<dynamic> addIncidents) async {
    try {
      await AuthService().db.collection("Reporte").add({
        "Alumnos_NumControl": addIncidents[0],
        "Alumnos_Nombre": addIncidents[1],
        "Grupo": addIncidents[2],
        "Semestre": addIncidents[3],
        "Especialidad": addIncidents[4],
        "Asignatura": addIncidents[5],
        "Comentarios": addIncidents[6],
        "Incidencias": addIncidents[7],
        "FechaReporte": addIncidents[8],
        "Maestros_idMaestros": addIncidents[9],
        "Maestros_uid": addIncidents[10],
      });
      incidents += addIncidents;
      notifyListeners();
      debugPrint('Los datos fueron cargados con éxito: $incidents');

      return true;
    } catch (e) {
      debugPrint('Error al agregar incidencias a Firestore $e');
      return false;
    }
  }
}
