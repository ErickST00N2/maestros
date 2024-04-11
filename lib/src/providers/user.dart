import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maestros/src/services/auth.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';

/// Clase que representa el modelo de datos del usuario.
class UserModel with ChangeNotifier {
  /// Hace una instancia única de la clase [UserModel].
  ///
  /// Este constructor privado se utiliza para crear una única instancia de la
  /// clase
  /// [UserModel] utilizando el patrón Singleton. Llama internamente al método
  /// [getUserData] para obtener los datos del usuario.
  factory UserModel() {
    _instancia.getUserData(_instancia.authService.firebaseUser);
    return _instancia;
  }

  UserModel._private();
  static final UserModel _instancia = UserModel._private();

  /// Hace una instancia de la clase [AuthService].
  final AuthService authService = AuthService();

  DocumentReference? _carrerasIdCarreras;

  DocumentReference? _idMaestros;

  String _uid = '';
  String _curp = 'Cargando...';

  String _typeSystem = 'Cargando...';

  String _turn = 'Cargando...';
  String _dateEmition = 'Cargando...';

  String _schoolCycle = 'Cargando...';

  DateTime _lastSign = DateTime.now();

  String _claveMaestro = 'Cargando...';

  String _nombre = 'Cargando...';

  String _photoURL = 'assets/webp/blank-profile-picture-973460_960_720.webp';

  String _correo = 'Cargando...';

  String _nivelEducativo = 'Cargando...';

  String _password = 'Cargando...';

  String _direccion = 'Cargando...';

  String _especialidad = 'Cargando...';

  int _numTel = 0;

  /// Código de error
  String errorCode = '';

  bool _error = false;

  /// Indica si hay un error.
  ///
  /// Getter para la variable `_error` que indica si ha ocurrido un error.
  bool get error => _error;

  /// Setter para la variable `_error`.
  set error(bool value) {
    _error = value;
    notifyListeners();
  }

  String _errorMessage = '';

  String _blooType = 'Cargando...';

  /// Obtiene el tipo de sangre del usuario.
  ///
  /// Getter para la variable `_blooType` que representa el tipo de sangre del
  /// usuario.
  String get blooType => _blooType;

  /// Setter para la variable `_blooType`.
  set blooType(String value) {
    _blooType = value;
    notifyListeners();
  }

  /// Obtiene el ID de la carrera del usuario.
  ///
  /// Getter para la variable `_carrerasIdCarreras` que representa el ID de la
  /// carrera
  /// del usuario.
  DocumentReference? get carrerasIdCarreras => _carrerasIdCarreras;

  /// Setter para la variable `_carrerasIdCarreras`.
  set carrerasIdCarreras(DocumentReference? value) {
    _carrerasIdCarreras = value;
    notifyListeners();
  }

  /// Obtiene la clave del maestro.
  ///
  /// Getter para la variable `_claveMaestro` que representa la clave del
  /// maestro.
  String get claveMaestro => _claveMaestro;

  /// Setter para la variable `_claveMaestro`.
  set claveMaestro(String value) {
    _claveMaestro = value;
    notifyListeners();
  }

  /// Obtiene el correo electrónico del usuario.
  ///
  /// Getter para la variable `_correo` que representa el correo electrónico
  /// del usuario.
  String get correo => _correo;

  /// Setter para la variable `_correo`.
  set correo(String value) {
    _correo = value;
    notifyListeners();
  }

  /// Obtiene la CURP del usuario.
  ///
  /// Getter para la variable `_curp` que representa la CURP del usuario.
  String get curp => _curp;

  /// Setter para la variable `_curp`.
  set curp(String value) {
    _curp = value;
    notifyListeners();
  }

  /// Obtiene la fecha de emisión de la credencial de modificación de la
  /// escuela.
  ///
  /// Getter para la variable `_dateEmition` que representa la fecha de emisión
  /// de la credencial de modificación de la escuela.
  String get dateEmition => _dateEmition;

  /// Setter para la variable `_dateEmition`.
  set dateEmition(String value) {
    _dateEmition = value;
    notifyListeners();
  }

  /// Obtiene la dirección del usuario.
  ///
  /// Getter para la variable `_direccion` que representa la dirección del
  /// usuario.
  String get direccion => _direccion;

  /// Setter para la variable `_direccion`.
  set direccion(String value) {
    _direccion = value;
    notifyListeners();
  }

  /// Obtiene el mensaje de error.
  ///
  /// Getter para la variable `_errorMessage` que representa el mensaje de
  /// error.
  String get errorMessage => _errorMessage;

  /// Setter para la variable `_errorMessage`.
  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  /// Obtiene la especialidad del usuario.
  ///
  /// Getter para la variable `_especialidad` que representa la especialidad
  /// del usuario.
  String get especialidad => _especialidad;

  /// Setter para la variable `_especialidad`.
  set especialidad(String value) {
    _especialidad = value;
    notifyListeners();
  }

  /// Obtiene el ID del maestro.
  ///
  /// Getter para la variable `_idMaestros` que representa el ID del maestro.
  DocumentReference? get idMaestros => _idMaestros;

  /// Setter para la variable `_idMaestros`.
  set idMaestros(DocumentReference? value) {
    _idMaestros = value;
    notifyListeners();
  }

  /// Obtiene la última fecha de inicio de sesión del usuario.
  ///
  /// Getter para la variable `_lastSign` que representa la última fecha de
  /// inicio de sesión del usuario.
  DateTime get lastSign => _lastSign;

  /// Setter para la variable `_lastSign`.
  set lastSign(DateTime value) {
    _lastSign = value;
    notifyListeners();
  }

  /// Obtiene el nivel educativo del usuario.
  ///
  /// Getter para la variable `_nivelEducativo` que representa el nivel
  /// educativo del usuario.
  String get nivelEducativo => _nivelEducativo;

  /// Setter para la variable `_nivelEducativo`.
  set nivelEducativo(String value) {
    _nivelEducativo = value;
    notifyListeners();
  }

  /// Obtiene el nombre del usuario.
  ///
  /// Getter para la variable `_nombre` que representa el nombre del usuario.
  String get nombre => _nombre;

  /// Setter para la variable `_nombre`.
  set nombre(String value) {
    _nombre = value;
    notifyListeners();
  }

  /// Obtiene el número de teléfono del usuario.
  ///
  /// Getter para la variable `_numTel` que representa el número de teléfono
  /// del usuario.
  int get numTel => _numTel;

  /// Setter para la variable `_numTel`.
  set numTel(int value) {
    _numTel = value;
    notifyListeners();
  }

  /// Obtiene la contraseña del usuario.
  ///
  /// Getter para la variable `_password` que representa la contraseña del
  /// usuario.
  String get password => _password;

  /// Setter para la variable `_password`.
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  /// Obtiene la URL de la foto del usuario.
  ///
  /// Getter para la variable `_photoURL` que representa la URL de la foto del
  /// usuario. [photoURL]
  ///
  /// Si la URL de la foto no está vacía y no es la URL predeterminada de la
  /// foto de perfil en blanco, devuelve un [NetworkImage] con la URL de la
  /// foto del usuario.
  ///
  /// De lo contrario, devuelve una [AssetImage] con la URL predeterminada de
  /// la foto de perfil en blanco.
  ImageProvider getPhotoURL(BuildContext context) {
    if (AuthService().status == AuthStatus.Authenticated &&
        context.watch<UserModel>().photoURL.isNotEmpty &&
        context.watch<UserModel>().photoURL !=
            'assets/webp/blank-profile-picture-973460_960_720.webp') {
      return NetworkImage(context.watch<UserModel>().photoURL);
    } else {
      return const AssetImage(
        'assets/webp/blank-profile-picture-973460_960_720.webp',
      );
    }
  }

  /// Obtiene la URL de la foto del usuario.
  ///
  /// Getter para la variable `_photoURL` que representa la URL de la foto del
  /// usuario. [photoURL]
  ///
  /// Si la URL de la foto no está vacía y no es la URL predeterminada de la
  /// foto de perfil en blanco, devuelve un [Image.network] con la URL de la
  /// foto del usuario.
  ///
  /// De lo contrario, devuelve una [Image.asset] con la URL predeterminada de
  /// la foto de perfil en blanco.
  Image getPhotoURL2(BuildContext context) {
    if (AuthService().status == AuthStatus.Authenticated &&
        context.watch<UserModel>().photoURL.isNotEmpty &&
        context.watch<UserModel>().photoURL !=
            'assets/webp/blank-profile-picture-973460_960_720.webp') {
      return Image.network(_photoURL);
    } else {
      return Image.asset(
        'assets/webp/blank-profile-picture-973460_960_720.webp',
      );
    }
  }

  /// Es parte de la documentacion de [getPhotoURL].

  String get photoURL => _photoURL;

  /// Setter para la variable `_photoURL`.
  ///
  /// Recibe una [String value] que representa la URL de la foto del usuario.
  ///
  /// Actualiza la variable `_photoURL` con la nueva URL de la foto y notifica
  /// a los listeners.
  set photoURL(String value) {
    _photoURL = value;
    notifyListeners();
  }

  /// Obtiene el ciclo escolar del usuario.
  ///
  /// Getter para la variable `_schoolCycle` que representa el ciclo escolar
  /// del usuario.
  String get schoolCycle => _schoolCycle;

  /// Setter para la variable `_schoolCycle`.
  set schoolCycle(String value) {
    _schoolCycle = value;
    notifyListeners();
  }

  /// Obtiene el turno del usuario.
  ///
  /// Getter para la variable `_turn` que representa el turno del usuario.
  String get turn => _turn;

  /// Setter para la variable `_turn`.
  set turn(String value) {
    _turn = value;
    notifyListeners();
  }

  /// Obtiene el tipo de sistema del usuario.
  ///
  /// Getter para la variable `_typeSystem` que representa el tipo de sistema
  /// del usuario.
  ///
  /// Coleccion: ModificationOfCchoolCredential
  String get typeSystem => _typeSystem;

  /// Setter para la variable `_typeSystem`.
  ///
  /// Coleccion: ModificationOfCchoolCredential
  set typeSystem(String value) {
    _typeSystem = value;
    notifyListeners();
  }

  /// Obtiene el ID del usuario.
  ///
  /// Getter para la variable `_uid` que representa el ID del usuario.
  String get uid => _uid;

  /// Setter para la variable `_uid`.
  set uid(String value) {
    _uid = value;
    notifyListeners();
  }

  /// Obtiene la URL de descarga para un archivo en Firebase Cloud Storage.
  ///
  /// Recibe un [filePath] como parámetro, que representa la ruta del archivo en
  /// Firebase Cloud Storage. Devuelve un [Future] que se completa con la URL de
  /// descarga del archivo. Si ocurre algún error durante el proceso, lo
  /// captura y lanza una excepción con un mensaje descriptivo.
  ///
  /// Devuelve un [Future] que se completa con una [String] representando la
  /// URL de descarga del archivo.
  Future<String> getDownloadUrl(String filePath) async {
    try {
      final ref = FirebaseStorage.instance.ref(filePath);
      final downloadURL = await ref.getDownloadURL();
      return downloadURL;
    } catch (error) {
      debugPrint('Error al obtener la URL de descarga: $error');
      return 'assets/webp/blank-profile-picture-973460_960_720.webp';
    }
  }

  /// Obtiene los datos del usuario de Firebase y los datos de la credencial de
  /// modificación de la escuela.
  ///
  /// Recibe un [User] que representa al usuario de Firebase.
  ///
  /// Realiza consultas a la base de datos para obtener los datos del usuario y
  /// de la credencial de modificación de la escuela.
  ///
  /// Verifica si los documentos existen y lanza una excepción si no.
  /// Actualiza los datos del usuario con la información obtenida de la base de
  /// datos.
  ///
  /// Actualiza las propiedades relacionadas con la credencial de modificación
  /// de la escuela.
  ///
  /// Notifica a los listeners una vez que se han actualizado los datos.
  Future<void> getUserData(User? firebaseUser) async {
    try {
      if (firebaseUser == null) {
        throw Exception('El usuario de Firebase es nulo.');
      }

      final maestroSnapshot = await authService.db
          .collection('Maestros')
          .doc(firebaseUser.uid)
          .get();

      final DocumentSnapshot modificationOfCchoolCredentialSnapshot =
          await authService.db
              .collection('ModificationOfCchoolCredential')
              .doc('jf7Pdk4pcks2DBufia5U')
              .get();

      if (!maestroSnapshot.exists) {
        throw Exception('El documento del Maestro no existe.');
      } else if (!modificationOfCchoolCredentialSnapshot.exists) {
        throw Exception('El documento de la credencial no existe.');
      }
      await _instancia.setFromFireStore(maestroSnapshot);
      typeSystem =
          modificationOfCchoolCredentialSnapshot['TypeSystem'] as String;
      turn = modificationOfCchoolCredentialSnapshot['Turn'] as String;

      dateEmition = DateFormat('dd/MM/yyyy').format(
        modificationOfCchoolCredentialSnapshot['DateEmition'] as DateTime,
      );

      schoolCycle =
          modificationOfCchoolCredentialSnapshot['SchoolCycle'] as String;
      notifyListeners();
      debugPrint(
          'el tipo de sistema es $typeSystem, el turno es $turn, la fecha de '
          'emisión es $dateEmition, el ciclo escolar es $schoolCycle');
    } catch (e) {
      debugPrint('Ocurrió un error al obtener los datos del Alumno: $e');
    }
  }

  /// Actualiza los datos del estudiante con la información obtenida de un
  /// [DocumentSnapshot].
  ///
  /// Recibe un [DocumentSnapshot] que contiene los datos del estudiante.
  /// Extrae los datos del DocumentSnapshot y actualiza las propiedades del
  /// estudiante.
  ///
  /// Verifica si algunos campos son nulos y asigna valores por defecto en caso
  /// de ser necesario.
  /// Notifica a los listeners una vez que se han actualizado los datos.
  Future<void> setFromFireStore(DocumentSnapshot userDoc) async {
    if (userDoc.exists) {
      final userData = userDoc.data() as Map<String, dynamic>?;
      if (userData != null) {
        curp = userData['CURP'] as String;
        claveMaestro = userData['ClaveMaestro'] as String;
        correo = userData['Correo'] as String;
        direccion = userData['Direccion'] as String;
        especialidad = userData['Especialidad'] as String;
        nivelEducativo = userData['NivelEducativo'] as String;
        nombre = userData['Nombre'] as String;
        numTel = userData['NumeroTel'] as int;
        password = userData['Password'] as String;
        idMaestros = userData['idmaestros'] as DocumentReference;

        if (userData['photoURL'] != null) {
          photoURL =
              await _instancia.getDownloadUrl(userData['photoURL'] as String);
        } else {
          photoURL = '';
        }

        if (userData['lastSign'] != null) {
          final timestamp = userData['lastSign'] as Timestamp;
          lastSign = timestamp.toDate();
        } else {
          lastSign = DateTime.now();
        }
        uid = userDoc.id;
        notifyListeners();
      }
    }
  }

  /// Actualiza la URL de la foto del estudiante y notifica a los listeners.
  ///
  /// Recibe una [url] que representa la ubicación de la foto en Firebase
  /// Storage y un [file] que contiene la foto a subir.
  ///
  /// Sube el archivo al Firebase Storage con la URL proporcionada y actualiza
  /// la propiedad [photoURL] del estudiante con la nueva URL.
  ///
  /// Notifica a los listeners una vez que se ha actualizado la URL de la foto.
  Future<void> setPhotoURL(String url, File file) async {
    final ref = FirebaseStorage.instance.ref(url);
    await ref.putFile(file);
    photoURL = url;
    notifyListeners();
  }
}
