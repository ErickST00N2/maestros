// ignore: lines_longer_than_80_chars
// ignore_for_file: use_build_context_synchronously, inference_failure_on_untyped_parameter, invalid_return_type_for_catch_error inference_failure_on_untyped_parameter, invalid_return_type_for_catch_error

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:maestros/src/layouts/util/colores.dart';
import 'package:maestros/src/layouts/util/info.dart';
import 'package:maestros/src/layouts/widgets/add_incidents/dropmenu.dart';
import 'package:maestros/src/layouts/widgets/util/show_snack_bar.dart';
import 'package:maestros/src/providers/list_incidents.dart';
import 'package:maestros/src/providers/student_form_provider.dart';
import 'package:maestros/src/providers/user.dart';
import 'package:provider/provider.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

/// [FormViewAddIncidents] -  Es una clase definida para mostrar en la pantalla
/// de inicio.
class FormViewAddIncidents extends StatelessWidget {
  /// ```[FormViewAddIncidents]``` -  Es el construcor de la clase definida para
  /// mostrar en la pantalla de inicio.
  FormViewAddIncidents({super.key});

  ///Colores de la aplicación ```ColoresApp```
  final ColoresApp cAplication = ColoresApp();

  // Controllers

  /// ```[_numControlController]``` - Es el controlador para el campo de texto
  /// de numero de control.
  final TextEditingController _numControlController = TextEditingController();

  /// ```[_nombreController]``` - Es el controlador para el campo de texto de
  /// nombre.
  final TextEditingController _nombreController = TextEditingController();

  /// ```[_semestreController]``` - Es el controlador para el campo de texto de
  /// semestre.
  final TextEditingController _semestreController = TextEditingController();

  /// ```[_grupoController]``` - Es el controlador para el campo de texto de
  /// grupo.
  final TextEditingController _grupoController = TextEditingController();

  /// ```[_especialidadController]``` - Es el controlador para el campo de texto
  /// de especialidad.
  final TextEditingController _especialidadController = TextEditingController();

  /// ```[_asignaturaController]``` - Es el controlador para el campo de texto
  /// de asignatura.
  final TextEditingController _asignaturaController = TextEditingController();

  /// ```[_comentariosController]``` - Es el controlador para el campo de texto
  /// de comentarios.
  final TextEditingController _comentariosController = TextEditingController();

  /// ```[_controllerDate]``` - Es el controlador para el campo de texto de
  /// fecha. Se inicializa con la fecha actual.
  final _controllerDate =
      TextEditingController(text: DateTime.now().toString());
  // Variables con keys
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  // FocusNodes
  final _numControlFocus = FocusNode();

  final _semestreFocus = FocusNode();

  final _grupoFocus = FocusNode();

  final _especialidadFocus = FocusNode();

  final _asignaturaFocus = FocusNode();

  final _comentariosFocus = FocusNode();

  // Espacios entre los campos

  /// ```[espaciadoVertical]``` es el espacio entre los elementos
  final double espaciadoVertical = 30;

  /// ```[espaciadoHorizontal]``` es el espacio entre los elementos
  final double espaciadoHorizontal = 30;

  /// ```[semestre]``` es una lista de String que contiene los semestres
  final List<String> semestre = ['1', '2', '3', '4', '5', '6'];

  /// ```[grupo]``` es una lista de String que contiene los grupos
  final List<String> grupo = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
  ];

  /// ```[especialidad]``` es una lista de String que contiene las
  /// especialidades
  final List<String> especialidad = [
    'Administración de Recursos Humanos',
    'Electrónica',
    'Logística',
    'Mantenimiento Automotriz',
    'Programación',
    'Puericultura',
    'Transformación de Plásticos',
  ];

  /// ```[asignatura]``` es una lista de String que contiene las asignaturas
  final List<String> asignatura = InfoAplication().asignatura;

  /// ```[incidencias]``` es una lista de String que contiene las incidencias
  /// posibles
  final List<String> incidencias = [
    'Falta de Asistencia',
    'No Entrega Actividades',
    'No entrega Tarea',
    'Es Indisciplinado',
    'Retardos Consecutivos',
    'Falta de Respeto',
    'Comportamiento Agresivo',
    'Falta de Atención',
    // Agrega más incidencias aquí según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return _searchViewWidget(context);
  }

  Widget _searchViewWidget(BuildContext context) {
    //ShowSnackBar sSB = ShowSnackBar(context: context);
    final sSB = ShowSnackBar(context: context);
    _numControlController.text = context.watch<StudentForm>().numControl;

    _nombreController.text = context.watch<StudentForm>().nombre;

    _semestreController.text = context.watch<StudentForm>().semestre;

    _grupoController.text = context.watch<StudentForm>().grupo;

    _especialidadController.text = context.watch<StudentForm>().especialidad;

    _asignaturaController.text = context.watch<StudentForm>().asignatura;

    //_incidencias_Controller.text = context.watch<StudentForm>().incidencia;

    _comentariosController.text = context.watch<StudentForm>().comentarios;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SearchBarAnimation(
                hintText: 'Ingresa el de No. Control',
                trailingWidget: const Icon(Icons.search_rounded, size: 20),
                buttonWidget: const Icon(Icons.search_rounded, size: 20),
                secondaryButtonWidget:
                    const Icon(Icons.search_off_rounded, size: 20),
                textInputType: TextInputType.number,
                hintTextColour: Color(cAplication.fuerteMedio),
                buttonShadowColour: Color(cAplication.medio),
                textEditingController: _numControlController,
                isOriginalAnimation: true,
                enableKeyboardFocus: true,
                onChanged: (String value) {
                  context.watch<StudentForm>().numControl = value;
                  debugPrint('onChanged: $value');
                },
                enteredTextStyle: const TextStyle(fontStyle: FontStyle.italic),
                buttonBorderColour: Color(cAplication.fuerteMedio),
                onExpansionComplete: () {
                  debugPrint('do something just after searchbox is opened.');
                },
                onCollapseComplete: () {
                  debugPrint('do something just after searchbox is closed.');
                },
                onPressButton: (isSearchBarOpens) {
                  debugPrint(
                    'do something before animation started. Its the '
                    '${isSearchBarOpens ? 'opening' : 'closing'} animation',
                  );
                },
                onFieldSubmitted: (String value) async {
                  final isFound = await context
                      .read<StudentForm>()
                      .setStudent(int.parse(value));
                  isFound
                      ? sSB.showSnackBarMessage(
                          isSuccess: true,
                          message: 'Alumno encontrado',
                        )
                      : sSB.showSnackBarMessage(
                          isSuccess: false,
                          message: 'Alumno no encontrado',
                        );
                  debugPrint('El onFieldSubmitted value $value');
                },
                onSaved: (String value) {
                  debugPrint('onSaved: $value');
                },
              ),

              // Espacio de separación vertical
              SizedBox(
                height: espaciadoVertical,
              ),

              // NUMERO DE CONTROL y NOMBRE
              TextFormField(
                controller: _numControlController,
                keyboardAppearance: Brightness.light,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.key_sharp,
                    color: Color(cAplication.fuerte),
                  ),
                  labelText: 'No. Control',
                ),
                onChanged: (value) => context.read<StudentForm>().numControl =
                    int.parse(value) as String,
              ),
              SizedBox(
                height: espaciadoVertical,
              ),
              // NOMBRE
              TextFormField(
                controller: _nombreController,
                focusNode: _numControlFocus,
                keyboardAppearance: Brightness.light,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_2_outlined,
                    color: Color(cAplication.fuerte),
                  ),
                  labelText: 'Nombre',
                ),
                onChanged: (value) =>
                    context.read<StudentForm>().nombre = value,
              ),

              // Espacio de separación vertical
              SizedBox(
                height: espaciadoVertical,
              ),

              // SEMESTRE y GRUPO

              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: SizedBox(
                      width: 200,

                      // SEMESTRE
                      child: DropMenu2(
                        semestreFocus: _semestreFocus,
                        value: context.watch<StudentForm>().semestre,
                        isExpanded: true,
                        hint: const Text('Semestre'),
                        itemsList: semestre,
                        onChanged: (value) => context
                            .read<StudentForm>()
                            .semestre = value.toString(),
                      ),
                      /*FormBuilderDropdown(
                        initialValue:
                            context.watch<StudentForm>().semestre ?? '',
                        key: _semestreKey,
                        focusNode: _nombreFocus,
                        decoration: const InputDecoration(
                          hintText: 'Semestre',
                        ),
                        name: 'Semestre',
                        items: semestre
                            .map((item) => DropdownMenuItem(
                                value: item, child: Text(item)))
                            .toList(),
                        onChanged: (value) => context
                            .read<StudentForm>()
                            .semestre = value.toString(),
                      ),*/
                    ),
                  ),

                  // Espacio de separación horizontal
                  Expanded(
                    child: SizedBox(
                      width: espaciadoHorizontal,
                    ),
                  ),

                  // GRUPO
                  Expanded(
                    flex: 5,
                    child: SizedBox(
                      width: 200,
                      child: DropMenu2(
                        semestreFocus: _grupoFocus,
                        value: context.watch<StudentForm>().grupo,
                        isExpanded: true,
                        hint: const Text('Grupo'),
                        itemsList: grupo,
                        onChanged: (value) => context
                            .read<StudentForm>()
                            .grupo = value.toString(),
                      ),
                      //onChanged: onChanged),
                    ),
                  ),
                ],
              ),

              // Espacio de separación vertical
              SizedBox(
                height: espaciadoVertical,
              ),

              //ESPECIALIDAD Y ASIGNATURA
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: DropMenu2(
                      semestreFocus: _especialidadFocus,
                      value: context.watch<StudentForm>().especialidad,
                      isExpanded: true,
                      hint: const Text('Especialidad'),
                      itemsList: especialidad,
                      onChanged: (value) => context
                          .read<StudentForm>()
                          .especialidad = value.toString(),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: espaciadoHorizontal,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: DropMenu2(
                      semestreFocus: _asignaturaFocus,
                      value: context.watch<StudentForm>().asignatura,
                      isExpanded: true,
                      hint: const Text('Asignatura'),
                      itemsList: asignatura,
                      onChanged: (value) => context
                          .read<StudentForm>()
                          .asignatura = value.toString(),
                    ),
                  ),
                ],
              ),

              // Espacio de separación vertical
              SizedBox(
                height: espaciadoVertical,
              ),

              /// Esta es la lista de Incidencias a reportar en unos
              /// checkboxes.
              ///
              ///
              ///

              FormBuilderCheckboxGroup(
                separator: const Divider(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                valueTransformer: (value) {
                  return value;
                },
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Por favor, seleccione al menos una incidencia';
                  }
                  return null;
                },
                name: 'Incidencias',
                activeColor: Color(cAplication.medio),
                orientation: OptionsOrientation.vertical,
                onChanged: (value) {
                  //incidentsSelected = value as List<String>;
                  context.read<StudentForm>().incidencia = value!;
                },
                checkColor: Colors.white,
                options: incidencias
                    .map(
                      (item) => FormBuilderFieldOption(
                        value: item,
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: Text(item),
                        ),
                      ),
                    )
                    .toList(),
              ),

              // Espacio de separación vertical
              SizedBox(
                height: espaciadoVertical,
              ),

              // COMENTARIOS DEL MAESTRO
              TextField(
                minLines: 1,
                maxLines: 10,
                controller: _comentariosController,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                focusNode: _comentariosFocus,
                onChanged: (value) {
                  context.read<StudentForm>().comentarios = value;
                },
                decoration: InputDecoration(
                  hintText: 'Comentarios del Maestro',
                  border: const OutlineInputBorder(),
                  labelText: 'Comentarios del Maestro',
                  fillColor: Color(cAplication.fuerte),
                ),
              ),

              // Espacio de separación vertical
              SizedBox(
                height: espaciadoVertical,
              ),

              //FECHA Y HORA DE LA INCIDENCIA
              FormBuilderDateTimePicker(
                onChanged: (value) {
                  context.read<StudentForm>().dateReport = value!;
                },
                initialValue: context.watch<StudentForm>().dateReport,
                name: 'dateincidencia',
                anchorPoint: Offset.infinite,
                currentDate: DateTime(1900),
                initialDate: DateTime.now(),
                decoration: const InputDecoration(
                  labelText: 'Seleccionar Fecha y hora de la Incidencia',
                  fillColor: Colors.black,
                  focusColor: Colors.blueGrey,
                ),
                controller: _controllerDate,
              ),

              SizedBox(
                height: espaciadoVertical,
              ),

              // Botones.
              Row(
                children: <Widget>[
                  Expanded(
                    child: SizedBox(width: espaciadoHorizontal),
                  ),
                  Expanded(
                    flex: 6,
                    child: TextButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color(cAplication.fuerte),
                        ),
                        foregroundColor: const MaterialStatePropertyAll(
                          Colors.white,
                        ),
                        iconColor: const MaterialStatePropertyAll(
                          Colors.white,
                        ),
                      ),
                      label: const Text('Enviar'),
                      icon: const Icon(Icons.send_outlined),
                      onPressed: () => _addIncidentsButton(context),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(width: espaciadoHorizontal),
                  ),
                  Expanded(
                    flex: 6,
                    child: TextButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color(cAplication.fuerte),
                        ),
                        foregroundColor: const MaterialStatePropertyAll(
                          Colors.white,
                        ),
                        iconColor: const MaterialStatePropertyAll(
                          Colors.white,
                        ),
                      ),
                      label: const Text('Limpiar'),
                      icon: const Icon(Icons.cleaning_services_outlined),
                      onPressed: () async {
                        await context.read<StudentForm>().clear();
                      },
                    ),
                  ),
                  Expanded(
                    child: SizedBox(width: espaciadoHorizontal),
                  ),
                ],
              ),

              /*FormBuilderDateTimePicker(
                name: 'date',
                anchorPoint: Offset.infinite,
                currentDate: DateTime(1900),
                decoration: InputDecoration(
                  fillColor: Color(cAplication.fuerte),
                  labelText: 'Cita',
                ),
                onChanged: (value) {
                  debugPrint(value.toString());
                },
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _addIncidentsButton(BuildContext context) async {
    final sSB = ShowSnackBar(context: context);

    final incidents = <dynamic>[
      context.read<StudentForm>().numControl,
      context.read<StudentForm>().nombre,
      context.read<StudentForm>().grupo,
      context.read<StudentForm>().semestre,
      context.read<StudentForm>().especialidad,
      context.read<StudentForm>().asignatura,
      context.read<StudentForm>().comentarios,
      context.read<StudentForm>().incidencia,
      context.read<StudentForm>().dateReport,
      context.read<UserModel>().idMaestros,
      context.read<UserModel>().uid,
    ];
    debugPrint('Incidencias: $incidents');
    dynamic onErrorShow;
    final result = await context
        .read<ListIncidents>()
        .addIncidents(incidents)
        .catchError((onError) => onErrorShow = onError);
    await context.read<StudentForm>().clear();
    if (result) {
      sSB.showSnackBarMessage(
        isSuccess: true,
        message: 'Incidencia agregada correctamente',
      );
    } else {
      sSB.showSnackBarMessage(
        isSuccess: false,
        message: 'No se pudo agregar la incidencia $onErrorShow',
      );
    }
  }
}
