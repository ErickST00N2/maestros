import 'package:flutter/material.dart';

class InfoAplication with ChangeNotifier {
  static final InfoAplication _instancia = InfoAplication._private();
  factory InfoAplication() {
    return _instancia;
  }
  InfoAplication._private();

  String _versionApp = '1.0.0';

  String get versionApp => _versionApp;

  set versionApp(String value) {
    _versionApp = value;
  }

  String _nameApp = 'Sistema de Credenciales QR';
  String get nameApp => _nameApp;
  set nameApp(String value) => _nameApp = value;

  String _nameSubApp = 'Credencial Digital';
  String get nameSubApp => _nameSubApp;
  set nameSubApp(String value) => _nameSubApp = value;

  String _nameSubApp2 = 'Alumnos';
  String get nameSubApp2 => _nameSubApp2;
  set nameSubApp2(String value) => _nameSubApp2 = value;

  List _asignatura = [
    'LENGUA Y COMUNICACIÓN II',
    'INGLÉS II',
    'PENSAMIENTO MATEMÁTICO II',
    'CULTURA DIGITAL',
  ];

  List get asignatura => _asignatura;

  set asignatura(List value) {
    _asignatura = value;
  }
  //String
}
