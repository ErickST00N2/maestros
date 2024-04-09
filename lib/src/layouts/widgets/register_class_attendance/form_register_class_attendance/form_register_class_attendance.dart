import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:maestros/src/layouts/util/colores.dart';
import 'package:maestros/src/layouts/util/info.dart';
import 'package:maestros/src/layouts/util/responsive/responsive_design.dart';

import 'package:maestros/src/layouts/widgets/register_class_attendance/form_register_class_attendance/list_dropdown_register.dart';
import 'package:maestros/src/providers/register_class_attendance/provider_register_class_attendance.dart';
import 'package:provider/provider.dart';

class FormRegisterClassAttendance extends StatelessWidget {
  FormRegisterClassAttendance({super.key});
  final InfoAplication info = InfoAplication();
  final ColoresApp cAplication = ColoresApp();

  final _formKey = GlobalKey<FormBuilderState>();
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
                          .map((item) => FormBuilderFieldOption(
                              value: item,
                              child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: AutoSizeText(
                                    item['Nombre'],
                                    maxLines: 2,
                                    maxFontSize: 25,
                                    minFontSize: 10,
                                    style: TextStyle(fontSize: 15),
                                  ))))
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
              ))
        ],
      ),
    );
  }

  Widget submitButton(int semestre) {
    return Container();
  }
}
