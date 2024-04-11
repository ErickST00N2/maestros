import 'package:flutter/material.dart';
import 'package:maestros/src/layouts/util/info.dart';
import 'package:maestros/src/layouts/widgets/register_class_attendance/form_register_class_attendance/form_builder_dropdown_register_class_attendance.dart';
import 'package:maestros/src/providers/register_class_attendance/provider_register_class_attendance.dart';
import 'package:provider/provider.dart';

/// Widget para mostrar una lista de desplegables en el formulario de registro
/// de asistencia a clases.
///
/// Este widget muestra múltiples formularios de selección desplegable, cada
/// uno para un campo específico, como semestre, grupo, especialidad y materia.
class ListDropdownRegister extends StatelessWidget {
  /// Constructor de la clase.
  ListDropdownRegister({super.key});

  /// Instancia de la clase [InfoAplication] para obtener información estática.
  final InfoAplication info = InfoAplication();

  /// Método build para construir el widget.
  ///
  /// Devuelve una columna que contiene varios formularios de selección
  /// desplegable.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: FormBuilderDropdownRegisterClassAttendance(
                itemsList: info.semestre,
                name: 'Semestre',
                initialValue:
                    context.watch<ProviderRegisterClassAttendance>().semestre,
                labelText: 'Semestre',
                hintText: 'Selecciona el semestre',
                onChanged: (value) => context
                    .read<ProviderRegisterClassAttendance>()
                    .semestre = value!,
              ),
            ),
            const Expanded(
              flex: 2,
              child: SizedBox(width: 20),
            ),
            Expanded(
              flex: 5,
              child: FormBuilderDropdownRegisterClassAttendance(
                itemsList: info.grupo,
                name: 'Grupo',
                initialValue: 'A',
                labelText: 'Grupo',
                hintText: 'Selecciona el grupo',
                onChanged: (value) => context
                    .read<ProviderRegisterClassAttendance>()
                    .grupo = value!,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: FormBuilderDropdownRegisterClassAttendance(
                itemsList: info.especialidad,
                name: 'Especialidad',
                initialValue: context
                    .read<ProviderRegisterClassAttendance>()
                    .especialidad,
                labelText: 'Especialidad',
                hintText: 'Selecciona la especialidad',
                onChanged: (value) => context
                    .read<ProviderRegisterClassAttendance>()
                    .especialidad = value!,
              ),
            ),
            const Expanded(
              flex: 2,
              child: SizedBox(width: 20),
            ),
            Expanded(
              flex: 5,
              child: FormBuilderDropdownRegisterClassAttendance(
                itemsList: info.asignatura,
                name: 'Materia',
                initialValue: context.watch<RegisterClassAttendance>().materia,
                labelText: 'Materia',
                hintText: 'Selecciona tu materia',
                onChanged: (value) =>
                    context.read<RegisterClassAttendance>().materia = value!,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
