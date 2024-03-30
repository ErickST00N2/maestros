import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:maestros/src/providers/user.dart';
import 'package:maestros/src/layouts/util/colores.dart';

import 'package:maestros/src/layouts/widgets/credential/credential_users.dart';
import 'package:maestros/src/layouts/widgets/menu/menu_lateral.dart';
import 'package:maestros/src/layouts/widgets/util/pie_pagina/pie_pagina.dart';
import 'package:provider/provider.dart';

class DataTeacher extends StatefulWidget {
  const DataTeacher({super.key});

  @override
  State<DataTeacher> createState() => _DataTeacherState();
}

class _DataTeacherState extends State<DataTeacher> {
  ColoresApp cAplication = ColoresApp();
  Timer? _timer;
  bool _hasError = false;
  Users? _maestro; // Variable para almacenar el objeto Maestro

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 10), () {
      // Si los datos no se han cargado después de 10 segundos, muestra un mensaje de error
      if (mounted) {
        setState(() {
          _hasError = true; // Aquí puedes manejar el estado de error
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancela el timer cuando el widget se desecha
    super.dispose();
  }

  final _controllerGestureFlipCardCredential = GestureFlipCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Datos del Maestro",
          style: TextStyle(
            fontFamily: AutofillHints.jobTitle,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: cAplication.colorDelAppBar,
      ),
      body: FutureBuilder<void>(
        future: loadMaestroData(context).then((value) => debugPrint(
            'Cargando datos del maestro el archivo data_teacher...')),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError || _hasError) {
            _timer?.cancel(); // Cancela el timer si hay un error

            var error = snapshot.error;
            debugPrint('Error al cargar los datos del maestro $error');
            return Text('Error al cargar los datos del maestro $error');
          } else {
            _timer
                ?.cancel(); // Cancela el timer si los datos se cargan con éxito

            return buildDataTeacherContent(
                context, _maestro, _controllerGestureFlipCardCredential);
          }
        },
      ),
      drawer: const MenuLateral(),
      bottomNavigationBar: const FooterWidget(),
    );
  }

  Future<void> loadMaestroData(BuildContext context) async {
    _maestro = Provider.of<Users>(context, listen: false);
    await _maestro!.getUserData(_maestro!.authService.firebaseUser);
  }
}
