import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:maestros/src/providers/list_incidents.dart';

import 'package:maestros/src/providers/student_form_provider.dart';
import 'package:maestros/src/providers/user.dart';
import 'package:maestros/src/util/colores.dart';
import 'package:maestros/src/util/info.dart';

import 'package:maestros/src/layouts/widgets/add_incidents/dropmenu.dart';
import 'package:maestros/src/layouts/widgets/util/showSnackBar.dart';

import 'package:provider/provider.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

//TODO TERMINAR DE HACER ESTE ARCHIVO PARA HOY

///[FormViewAddIncidents] -  Es una clase definida para mostrar en la pantalla de inicio.
class FormViewAddIncidents extends StatelessWidget {
  FormViewAddIncidents({super.key});

  //Colores de la aplicación
  final ColoresApp cAplication = ColoresApp();

  // Controllers
  final TextEditingController _numControl_Controller = TextEditingController();

  final TextEditingController _nombre_Controller = TextEditingController();

  final TextEditingController _semestre_Controller = TextEditingController();

  final TextEditingController _grupo_Controller = TextEditingController();

  final TextEditingController _especialidad_Controller =
      TextEditingController();

  final TextEditingController _asignatura_Controller = TextEditingController();

  final TextEditingController _comentarios_Controller = TextEditingController();

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
  final double espaciadoVertical = 30.0;

  final double espaciadoHorizontal = 30.0;

  final List semestre = ["1", "2", "3", "4", "5", "6"];

  final List grupo = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"];

  final List especialidad = [
    'Administración de Recursos Humanos',
    'Electrónica',
    'Logística',
    'Mantenimiento Automotriz',
    'Programación',
    'Puericultura',
    'Transformación de Plásticos',
  ];

  final List asignatura = InfoAplication().asignatura;

// Incidencias
  final List incidencias = [
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

  ///TODO TERMINAR DE HACER ESTE ARCHIVO PARA HOY
  ///
  @override
  Widget build(BuildContext context) {
    return _searchViewWidget(context);
  }

  Widget _searchViewWidget(BuildContext context) {
    //ShowSnackBar sSB = ShowSnackBar(context: context);
    ShowSnackBar sSB = ShowSnackBar(context: context);
    _numControl_Controller.text =
        context.watch<StudentForm>().numControl.toString();

    _nombre_Controller.text = context.watch<StudentForm>().nombre;

    _semestre_Controller.text = context.watch<StudentForm>().semestre;

    _grupo_Controller.text = context.watch<StudentForm>().grupo;

    _especialidad_Controller.text = context.watch<StudentForm>().especialidad;

    _asignatura_Controller.text = context.watch<StudentForm>().asignatura;

    //_incidencias_Controller.text = context.watch<StudentForm>().incidencia;

    _comentarios_Controller.text = context.watch<StudentForm>().comentarios;

    return SingleChildScrollView(
      child: Container(
        width: 1000,
        padding: const EdgeInsets.all(8.0),
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
                durationInMilliSeconds: 1000,
                buttonShadowColour: Color(cAplication.medio),
                textEditingController: _numControl_Controller,
                isOriginalAnimation: true,
                enableKeyboardFocus: true,
                onChanged: (value) {
                  context.watch<StudentForm>().numControl = int.parse(value);
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
                      'do something before animation started. It\'s the ${isSearchBarOpens ? 'opening' : 'closing'} animation');
                },
                onFieldSubmitted: (String value) async {
                  bool isFound = await context
                      .read<StudentForm>()
                      .setStudent(int.parse(value));
                  isFound
                      ? sSB.showSnackBarMessage(true, 'Alumno encontrado')
                      : sSB.showSnackBarMessage(false, 'Alumno no encontrado');
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
                controller: _numControl_Controller,
                autocorrect: true,
                keyboardAppearance: Brightness.light,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.key_sharp,
                    color: Color(cAplication.fuerte),
                  ),
                  labelText: 'No. Control',
                ),
                onChanged: (value) =>
                    context.read<StudentForm>().numControl = int.parse(value),
              ),
              SizedBox(
                height: espaciadoVertical,
              ),
              // NOMBRE
              TextFormField(
                controller: _nombre_Controller,
                autocorrect: true,
                focusNode: _numControlFocus,
                keyboardAppearance: Brightness.light,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2_outlined,
                      color: Color(cAplication.fuerte)),
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
                    flex: 1,
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
                //disabled: ['Falta de Asistencia'],
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
                controlAffinity: ControlAffinity.leading,
                name: 'Incidencias',
                activeColor: Color(cAplication.medio),

                orientation: OptionsOrientation.vertical,
                onChanged: (value) {
                  //incidentsSelected = value as List<String>;
                  context.read<StudentForm>().incidencia = value!;
                },
                checkColor: Colors.white,
                options: incidencias
                    .map((item) => FormBuilderFieldOption(
                        value: item,
                        child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Text(item))))
                    .toList(),
              ),

              // Espacio de separación vertical
              SizedBox(
                height: espaciadoVertical,
              ),

              // COMENTARIOS DEL MAESTRO
              TextField(
                autocorrect: true,
                minLines: 1,
                maxLines: 10,
                controller: _comentarios_Controller,
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
                enabled: true,
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
                      flex: 1, child: SizedBox(width: espaciadoHorizontal)),
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
                      flex: 1, child: SizedBox(width: espaciadoHorizontal)),
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
                        context.read<StudentForm>().clear();
                      },
                    ),
                  ),
                  Expanded(
                      flex: 1, child: SizedBox(width: espaciadoHorizontal)),
                ],
              ),

              //TODO: ENTRADA DE FECHA DE CITA
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
    ShowSnackBar sSB = ShowSnackBar(context: context);

    List<dynamic> incidents = [
      context.read<StudentForm>().numControl,
      context.read<StudentForm>().nombre,
      context.read<StudentForm>().grupo,
      context.read<StudentForm>().semestre,
      context.read<StudentForm>().especialidad,
      context.read<StudentForm>().asignatura,
      context.read<StudentForm>().comentarios,
      context.read<StudentForm>().incidencia,
      context.read<StudentForm>().dateReport,
      context.read<Users>().idMaestros,
      context.read<Users>().uid
    ];
    debugPrint('Incidencias: $incidents');
    dynamic onErrorShow;
    var result = await context
        .read<ListIncidents>()
        .addIncidents(incidents)
        .catchError((onError) => onErrorShow = onError);
    await context.read<StudentForm>().clear();
    if (result) {
      sSB.showSnackBarMessage(true, 'Incidencia agregada correctamente');
    } else {
      sSB.showSnackBarMessage(
          false, 'No se pudo agregar la incidencia $onErrorShow');
    }
  }
}
