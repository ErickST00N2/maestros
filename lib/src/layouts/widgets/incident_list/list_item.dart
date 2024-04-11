import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maestros/src/providers/list_incidents.dart';
import 'package:provider/provider.dart';

/// Widget que representa un elemento de la lista de incidencias.
class ListItem extends StatefulWidget {
  /// Constructor de la clase ListItem.
  const ListItem({
    required this.docRef,
    super.key,
    // Valores predeterminados para los parámetros opcionales
    this.linkFotoPerfil =
        'assets/webp/blank-profile-picture-973460_960_720.webp',
    this.comentarios =
        'Cargando...', //'Aquí se coloca la descripción del Incidente',
    this.nameAlumn = 'Cargando...', // '<Nombre del Alumno>',
    this.especialidad = 'Cargando...', // '<Especialidad>',
    this.grupo = 'Cargando...', // '<Grupo del Alumno>',
    this.semestre = 'Cargando...', // '<Semestre del Alumno>',
  });

  /// Nombre del alumno.
  final String nameAlumn;

  /// Descripción del incidente.
  final String comentarios;

  /// Enlace a la foto de perfil del alumno.
  final String linkFotoPerfil;

  /// Especialidad del alumno.
  final String especialidad;

  /// Grupo del alumno.
  final String grupo;

  /// Semestre del alumno.
  final String semestre;

  /// Referencia de la incidencia.
  final DocumentReference docRef;

  @override
  State<ListItem> createState() => _ListItemState();
}

/// Estado de la clase ListItem.
class _ListItemState extends State<ListItem> {
  /// Lista de elementos del menú emergente.
  List<List<Object>> itemsList = [
    [Icons.delete, Colors.red, 10.00, 'Eliminar...'],
    // [Icons.view_comfy_rounded, Colors.green, 10.00, 'Ver mas...'],
  ];

  @override
  Widget build(BuildContext context) {
    return _buildPanel();
  }

  /// Construye el panel del elemento de la lista.
  Widget _buildPanel() {
    return Card(
      child: ListTile(
        leading:
            Image.asset(widget.linkFotoPerfil), // Imagen de perfil del alumno
        title: Text(
          // Título del elemento
          '${widget.nameAlumn} '
          '// ${widget.semestre}${widget.grupo} '
          '// ${widget.especialidad}',
        ),
        subtitle: Text(widget.comentarios), // Subtítulo del elemento
        trailing: PopupMenuButton<int>(
          itemBuilder: (context) => itemsList.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return PopupMenuItem<int>(
              value: index,
              child: Row(
                children: <Widget>[
                  Icon(
                    item[0] as IconData, // Icono del elemento
                    color: item[1] as Color, // Color del icono
                  ),
                  SizedBox(
                    // Espacio entre el icono y el texto
                    width: item[2] as double,
                  ),
                  Text(
                    item[3].toString(), // Texto del elemento
                  ),
                ],
              ),
              onTap: () async {
                // Manejo de la acción al seleccionar un elemento del menú
                switch (index) {
                  case 0:
                    await _showDeleteConfirmationDialog();
                  // case 1:
                  //   // Ver más
                  //   _showPdfDocument(context);
                  //   break;
                }
              },
            );
          }).toList(),
          //const Icon(Icons.more_vert_sharp), // Icono al final del elemento
        ),

        // Indica si el elemento tiene tres líneas de contenido
        isThreeLine: true,
      ),
    );
  }

  /// Muestra un diálogo de confirmación para eliminar el elemento.
  Future<void> _showDeleteConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar eliminación'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('¿Estás seguro de que deseas eliminar este elemento?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: const ButtonStyle(
                textStyle:
                    MaterialStatePropertyAll(TextStyle(color: Colors.black)),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo sin eliminar
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              style: const ButtonStyle(
                textStyle:
                    MaterialStatePropertyAll(TextStyle(color: Colors.black)),
              ),
              onPressed: () async {
                // Eliminar
                await context.read<ListIncidents>().deleteReport(
                      context: context,
                      docRef: widget.docRef,
                    ); // Llamar a la función de eliminación
                debugPrint('Eliminar...');
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: const Text(
                'Confirmar',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  // Future<void> _showPdfDocument(BuildContext context) async {
  //   debugPrint('Ver más...');

  //   Navigator.of(context)
  //       .pushNamed('/pdf_report_incident', arguments: widget.docRef);
  // }
}
