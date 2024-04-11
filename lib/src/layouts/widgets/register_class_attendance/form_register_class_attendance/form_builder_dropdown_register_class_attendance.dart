import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

/// Clase para crear un widget de selección desplegable que se utiliza en el
/// formulario de registro de asistencia a clases.
///
/// Este widget es Stateless, lo que significa que no tiene estado interno y no
/// se puede modificar una vez creado.
///
/// Los parámetros necesarios para su creación son:
/// - `itemsList`: Lista de opciones que se mostrarán en el desplegable.
/// - `name`: Nombre del campo en el formulario.
/// - `initialValue`: Valor inicial del campo.
/// - `labelText`: Texto que se mostrará como etiqueta del campo.
/// - `hintText`: Texto que se mostrará como sugerencia de entrada del campo.
///
/// El código de la clase se puede ver en el archivo
/// [FormBuilderDropdownRegisterClassAttendance].
class FormBuilderDropdownRegisterClassAttendance extends StatelessWidget {
  /// Constructor de la clase.
  ///
  /// Recibe los parámetros necesarios para la creación del widget.
  const FormBuilderDropdownRegisterClassAttendance({
    required this.itemsList,
    required this.name,
    required this.initialValue,
    required this.labelText,
    required this.hintText,
    required this.onChanged,
    super.key,
  });

  /// Lista de opciones que se mostrarán en el desplegable.
  final List<String> itemsList;

  /// Función que se ejecutará cuando cambie el valor del desplegable.
  final void Function(String?)? onChanged;

  /// Nombre del campo en el formulario.
  final String name;

  /// Valor inicial del campo.
  final String initialValue;

  /// Texto que se mostrará como etiqueta del campo.
  final String labelText;

  /// Texto que se mostrará como sugerencia de entrada del campo.
  final String hintText;

  /// Construye el widget de selección desplegable.
  ///
  /// Recibe el contexto del build y devuelve un FormBuilderDropdown con los
  /// parámetros dados.
  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<String>(
      name: name, // Nombre del campo
      initialValue: initialValue, // Valor inicial
      menuMaxHeight: 300,
      onChanged: onChanged, // Función que se ejecuta cuando cambia el valor
      decoration: InputDecoration(
        labelText: labelText, // Texto de la etiqueta
        hintText: hintText, // Texto de la sugerencia de entrada
      ),
      items: itemsList.map((item) {
        return DropdownMenuItem(
          alignment: AlignmentDirectional.center, // Alineación de las opciones
          value: item, // Valor de la opción
          child: ListTile(
            title: Text(item), // Texto de la opción
          ),
        );
      }).toList(), // Convierte la lista en una lista de DropdownMenuItem
    );
  }
}
