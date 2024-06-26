import 'package:flutter/material.dart';
import 'package:maestros/src/app.dart';
//Librerias de firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

@override

///@ErickST00N
///[main] En la función principal estamos inicializando a firebase
///para poder conectar a la base de datos de la API
///Sistema de Decredenciales QR
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}
