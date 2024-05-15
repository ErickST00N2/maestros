import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

/// A Clase para crear un widget de selección desplegable que se utiliza en el formulario de registro de asistencia a clases.
/// Esta clase es un widget Stateless, lo que significa que no tiene estado interno y no se puede modificar una vez creado.
/// Los parámetros necesarios para su creación son:
/// - `[itemsList]` es la lista de opciones que se mostrarán en el desplegable.
/// - `[name]` es el nombre del campo en el formulario.
/// - `[initialValue]` es el valor inicial del campo.
/// - `[labelText]` es el texto que se mostrará como etiqueta del campo.
/// - `[hintText]` es el texto que se mostrará como sugerencia de entrada del campo.
///
/// El código de la clase se puede ver en el archivo [FormBuilderDropdownRegisterClassAttendance.dart].
class FormBuilderDropdownRegisterClassAttendance extends StatelessWidget {
  // Constructor para la clase, recibe los parámetros necesarios
  const FormBuilderDropdownRegisterClassAttendance({
    super.key,
    required this.itemsList,
    required this.name,
    required this.initialValue,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
  });

  // Atributos de la clase
  final List<String> itemsList;
  final void Function(String?)? onChanged;
  final String name;
  final String initialValue;
  final String labelText;
  final String hintText;

  /// Función que construye el widget de selección desplegable.
  /// Recibe el contexto del build y devuelve un FormBuilderDropdown con los parámetros dados.
  @override
  Widget build(BuildContext context) {
    // Crea el FormBuilderDropdown con los parámetros dados
    return FormBuilderDropdown<String>(
      name: name, // Nombre del campo
      initialValue: initialValue, // Valor inicial
      menuMaxHeight: 300,

      onChanged: onChanged, // Función que se ejecuta cuando cambia el valor
      decoration: InputDecoration(
        // Decoración del campo
        labelText: labelText, // Texto de la etiqueta

        hintText: hintText, // Texto de la sugerencia de entrada
      ),
      items: itemsList
          .map((item) => DropdownMenuItem(
                // Crea una lista de opciones
                alignment:
                    AlignmentDirectional.center, // Alineación de las opciones
                value: item, // Valor de la opción
                child: ListTile(title: Text(item)), // Texto de la opción
              ))
          .toList(), // Convierte la lista en una lista de DropdownMenuItem
    );
  }
}
