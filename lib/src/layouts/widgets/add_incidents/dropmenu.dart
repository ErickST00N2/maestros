import 'package:flutter/material.dart';

class DropMenu2 extends StatelessWidget {
  DropMenu2(
      {super.key,
      required this.value,
      required this.isExpanded,
      required this.semestreFocus,
      required this.itemsList,
      required this.hint,
      required this.onChanged});
  late final void Function(Object? value)? onChanged;
  late final bool isExpanded;
  late final FocusNode semestreFocus;
  late final Object value;

  late final Text hint;
  late final List<dynamic> itemsList;

  @override
  Widget build(BuildContext context) {
    return value.toString() != ''
        ? DropdownButton(
            isExpanded: isExpanded,
            value: value,
            key: key,
            focusNode: semestreFocus,
            onChanged: onChanged,
            disabledHint: hint,
            hint: hint,
            items: itemsList
                .map((item) =>
                    DropdownMenuItem(value: item, child: Text(item.toString())))
                .toList())
        : DropdownButton(
            isExpanded: isExpanded,
            key: key,
            hint: hint,
            focusNode: semestreFocus,
            onChanged: onChanged,
            disabledHint: hint,
            items: itemsList
                .map((item) =>
                    DropdownMenuItem(value: item, child: Text(item.toString())))
                .toList());
  }
}
