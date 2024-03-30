import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String nameAlumn; // Nombre del alumno
  final String description; // Descripción del incidente
  final String linkFotoPerfil; // Enlace a la foto de perfil del alumno
  final String especialidad; // Especialidad del alumno
  final String grupo; // Grupo del alumno
  final String semestre; // Semestre del alumno

  const ListItem({
    Key? key,
    // Valores predeterminados para los parámetros opcionales
    this.linkFotoPerfil =
        "assets/webp/blank-profile-picture-973460_960_720.webp",
    this.description = "Aquí se coloca la descripción del Incidente",
    this.nameAlumn = '<Nombre del Alumno>',
    this.especialidad = "<Especialidad>",
    this.grupo = '<Grupo del Alumno>',
    this.semestre = '<Semestre del Alumno>',
  }) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  List<dynamic> itemsList = [
    [Icons.delete, Colors.red, 10.00, 'Eliminar...'],
    [Icons.update, Colors.blue, 10.00, 'Actualizar...'],
    [Icons.view_comfy_rounded, Colors.green, 10.00, 'Ver mas...'],
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
        subtitle: Text(widget.description), // Subtítulo del elemento
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
              onTap: () {
                // Manejo de la acción al seleccionar un elemento del menú
                switch (index) {
                  case 0:
                    // Eliminar
                    debugPrint('Eliminar...');
                    break;
                  case 1:
                    // Actualizar
                    debugPrint('Actualizar...');
                    break;
                  case 2:
                    // Ver más
                    debugPrint('Ver más...');
                    break;
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
}
