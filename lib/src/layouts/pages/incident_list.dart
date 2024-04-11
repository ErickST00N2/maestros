import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maestros/src/providers/list_incidents.dart';

import 'package:maestros/src/providers/user.dart';
import 'package:maestros/src/layouts/widgets/menu/menu_lateral.dart'; // Importa el menú lateral personalizado
import 'package:provider/provider.dart';

import '../widgets/incident_list/list_item.dart'; // Importa el widget de elemento de lista personalizado

class IncidentListPage extends StatelessWidget {
  IncidentListPage({super.key});
  // Constructor de la clase IncidentList

  /// [maestro] - Es un objeto de la clase UserModel que contiene la
  /// información del usuario.
  final UserModel maestro = UserModel();

  @override
  Widget build(BuildContext context) {
    /// [size] - Es el tamaño de la pantalla que se obtiene del dispositivo.
    final size = MediaQuery.of(context).size;

    /// [maxWidthScreenCard] - Evaluamos la anchura de la pantalla para saber si
    /// nuestra credencial tendrá un ancho maximo de 700 pixeles o si sigue con
    /// el valor por defecto de 0.95.
    final maxWidthScreenCard =
        (size.width > 800.0) ? (600.0) : (size.width * 0.95);
    return Scaffold(
      // Devuelve un Scaffold que contiene la estructura de la pantalla
      appBar: AppBar(
        // AppBar de la pantalla
        title: const Text(
          // Título de la AppBar
          'Lista de Incidencias', // Texto del título
          style: TextStyle(
            // Estilo del texto del título
            fontFamily: AutofillHints.jobTitle, // Fuente del texto
            color: Color.fromARGB(255, 255, 255, 255),
          ), // Color del texto
        ),
        backgroundColor:
            const Color.fromRGBO(2, 169, 218, 1), // Color de fondo de la AppBar
      ),
      drawer: const MenuLateral(), // Menú lateral de la pantalla
      body: Center(
        child: FutureBuilder<List<DocumentSnapshot<Object?>>>(
          future: context.read<ListIncidents>().getReportes(context),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<DocumentSnapshot<Object?>>> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Muestra un indicador de carga mientras se espera la carga de
              // datos.
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(
                'Error: ${snapshot.error}',
              ); // Maneja el caso de error.
            } else {
              final incidents = snapshot.data ?? [];
              return Container(
                margin: const EdgeInsets.only(top: 10),
                width: maxWidthScreenCard,
                child: ListView.builder(
                  itemCount: incidents.length,
                  itemBuilder: (context, index) {
                    final nameAlumn = incidents[index]['Alumnos_Nombre'];

                    return ListItem(
                      nameAlumn: nameAlumn as String,
                      semestre: incidents[index]['Semestre'] as String,
                      grupo: incidents[index]['Grupo'] as String,
                      especialidad: incidents[index]['Especialidad'] as String,
                      comentarios: incidents[index]['Comentarios'] as String,
                      docRef: incidents[index].reference,
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
