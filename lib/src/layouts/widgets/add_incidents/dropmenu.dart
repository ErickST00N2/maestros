import 'package:flutter/material.dart';

/// Widget para mostrar un menú desplegable.
class DropMenu2 extends StatelessWidget {
  /// Constructor de la clase DropMenu2.
  const DropMenu2({
    required this.value,
    required this.isExpanded,
    required this.semestreFocus,
    required this.itemsList,
    required this.hint,
    required this.onChanged,
    super.key,
  });

  /// Valor seleccionado en el menú desplegable.
  final Object value;

  /// Indica si el menú desplegable está expandido o no.
  final bool isExpanded;

  /// Nodo de enfoque para el menú desplegable.
  final FocusNode semestreFocus;

  /// Lista de elementos que se mostrarán en el menú desplegable.
  final List<dynamic> itemsList;

  /// Texto de sugerencia que se mostrará cuando no haya ningún elemento
  /// seleccionado.
  final Text hint;

  /// Función que se llama cuando se selecciona un elemento del menú
  /// desplegable.
  final void Function(Object? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    // Verifica si el valor seleccionado no está vacío
    if (value.toString() != '') {
      // Si hay un valor seleccionado, devuelve un DropdownButton con el valor
      // seleccionado
      return DropdownButton(
        isExpanded: isExpanded,
        value: value,
        key: key,
        focusNode: semestreFocus,
        onChanged: onChanged,
        disabledHint: hint,
        hint: hint,
        items: itemsList
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(item.toString()),
              ),
            )
            .toList(),
      );
    } else {
      // Si no hay un valor seleccionado, devuelve un DropdownButton con la
      // sugerencia de texto
      return DropdownButton(
        isExpanded: isExpanded,
        key: key,
        hint: hint,
        focusNode: semestreFocus,
        onChanged: onChanged,
        disabledHint: hint,
        items: itemsList
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(item.toString()),
              ),
            )
            .toList(),
      );
    }
  }
}
