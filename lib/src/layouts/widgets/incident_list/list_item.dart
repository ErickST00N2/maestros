import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maestros/src/providers/list_incidents.dart';
import 'package:provider/provider.dart';

class ListItem extends StatefulWidget {
  final String nameAlumn; // Nombre del alumno
  final String comentarios; // Descripción del incidente
  final String linkFotoPerfil; // Enlace a la foto de perfil del alumno
  final String especialidad; // Especialidad del alumno
  final String grupo; // Grupo del alumno
  final String semestre; // Semestre del alumno
  final DocumentReference docRef; // Referencia de la incidencia

  const ListItem({
    super.key,
    // Valores predeterminados para los parámetros opcionales
    this.linkFotoPerfil =
        "assets/webp/blank-profile-picture-973460_960_720.webp",
    this.comentarios = "Aquí se coloca la descripción del Incidente",
    this.nameAlumn = '<Nombre del Alumno>',
    this.especialidad = "<Especialidad>",
    this.grupo = '<Grupo del Alumno>',
    this.semestre = '<Semestre del Alumno>',
    required this.docRef,
  });

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  List<dynamic> itemsList = [
    [Icons.delete, Colors.red, 10.00, 'Eliminar...'],
    // [Icons.view_comfy_rounded, Colors.green, 10.00, 'Ver mas...'],
  ];

  @override
  Widget build(BuildContext context) {
    return _buildPanel();
  }

  Widget _buildPanel() {
    return Card(
      child: ListTile(
        leading:
            Image.asset(widget.linkFotoPerfil), // Imagen de perfil del alumno
        title: Text(
            "${widget.nameAlumn} // ${widget.semestre}${widget.grupo} // ${widget.especialidad}"), // Título del elemento
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
                    item[0], // Icono del elemento
                    color: item[1], // Color del icono
                  ),
                  SizedBox(
                    width: item[2], // Espacio entre el icono y el texto
                  ),
                  Text(
                    item[3], // Texto del elemento
                  ),
                ],
              ),
              onTap: () async {
                // Manejo de la acción al seleccionar un elemento del menú
                switch (index) {
                  case 0:
                    await _showDeleteConfirmationDialog();
                    break;

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
        isThreeLine:
            true, // Indica si el elemento tiene tres líneas de contenido
      ),
    );
  }

  ///showDeleteConfirmationDialog
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
                      MaterialStatePropertyAll(TextStyle(color: Colors.black))),
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
                      MaterialStatePropertyAll(TextStyle(color: Colors.black))),
              onPressed: () async {
                // Eliminar
                await context.read<ListIncidents>().deleteReport(
                    context: context,
                    docRef:
                        widget.docRef); // Llamar a la función de eliminación
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
