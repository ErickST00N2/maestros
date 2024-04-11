import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:maestros/src/layouts/util/colores.dart';
import 'package:maestros/src/layouts/util/info.dart';
import 'package:maestros/src/layouts/util/responsive/responsive_design.dart';
import 'package:maestros/src/layouts/widgets/register_class_attendance/form_register_class_attendance/list_dropdown_register.dart';
import 'package:maestros/src/providers/register_class_attendance/provider_register_class_attendance.dart';
import 'package:provider/provider.dart';

/// Widget que representa el formulario para registrar la asistencia a clase.
class FormRegisterClassAttendance extends StatelessWidget {
  /// Constructor de la clase FormRegisterClassAttendance.
  FormRegisterClassAttendance({super.key});

  /// Instancia de la clase InfoAplication.
  final InfoAplication info = InfoAplication();

  /// Instancia de la clase ColoresApp.
  final ColoresApp cAplication = ColoresApp();

  /// Clave global para el formulario.
  final _formKey = GlobalKey<FormBuilderState>();

  /// Instancia de la clase ResponsiveDesign.
  final ResponsiveDesign responsive = ResponsiveDesign();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      child: Column(
        children: [
          FormBuilder(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                ListDropdownRegister(),
                Card(
                  child: FormBuilderCheckboxGroup(
                    separator: const Divider(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    name: 'students',
                    options: context
                        .watch<ProviderRegisterClassAttendance>()
                        .students
                        .map(
                          (item) => FormBuilderFieldOption(
                            value: item,
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: AutoSizeText(
                                item['Nombre'].toString(),
                                maxLines: 2,
                                maxFontSize: 25,
                                minFontSize: 10,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    activeColor: Color(cAplication.medio),
                    checkColor: Colors.white,
                    orientation: OptionsOrientation.vertical,
                    onChanged: (value) {
                      context
                          .read<ProviderRegisterClassAttendance>()
                          .studentsRegisterClass = value!;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Widget para el botón de envío.
  Widget submitButton(int semestre) {
    return Container();
  }
}
