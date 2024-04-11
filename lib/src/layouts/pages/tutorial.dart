import 'package:flutter/material.dart';

import 'package:maestros/src/layouts/widgets/menu/menu_lateral.dart';

/// Clase que representa la pantalla de tutorial.
class Tutorial extends StatefulWidget {
  /// Constructor de la clase Tutorial.
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

/// Estado de la pantalla de tutorial.
class _TutorialState extends State<Tutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tutorial',
          style: TextStyle(
            fontFamily: AutofillHints.jobTitle,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromRGBO(2, 169, 218, 1),
      ),
      drawer: const MenuLateral(),
    );
  }
}
