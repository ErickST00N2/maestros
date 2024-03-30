import 'package:flutter/material.dart';
import 'package:maestros/src/providers/student_form_provider.dart';
import 'package:maestros/src/layouts/util/colores.dart';
import 'package:maestros/src/layouts/widgets/add_incidents/add_incidents_form.dart';
import 'package:maestros/src/layouts/widgets/menu/menu_lateral.dart';
import 'package:maestros/src/layouts/widgets/util/showSnackBar.dart';
import 'package:provider/provider.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

/// [AddIncidents] - Es una clase definida para mostrar en la pantalla de inicio.
class AddIncidents extends StatelessWidget {
  /// Constructor de la clase AddIncidents
  AddIncidents({super.key});

  //TODO: #3 Agregar botón para añadir incidencia desde la pantalla de inicio, agregar formulario de la incidencia y apuntarlo al alumno.
  final ColoresApp cAplication = ColoresApp();
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();

  @override

  /// Construye la interfaz de usuario que representa el widget de este estado [AddIncidents].
  ///
  /// Esta función devuelve un widget [Scaffold] que representa la
  /// estructura de la interfaz de usuario. Incluye un [AppBar] con el título
  /// "Añadir Incidencias" y un color de fondo de turquesa medio. El
  /// [body] del [Scaffold] es el resultado de llamar al método privado
  /// [_formContainer] con el parámetro [BuildContext]. La
  /// propiedad [drawer] del [Scaffold] es un widget [MenuLateral]. Finalmente,
  /// la propiedad [floatingActionButton] del [Scaffold] es un [IconButton]
  /// que muestra un [Icon] con el ícono "qr_code_2_outlined".
  /// con el parámetro [BuildContext].

  Widget build(BuildContext context) {
    String alumnoEncontrado = 'Alumno encontrado';
    String alumnoNoEncontrado = 'Alumno no encontrado';
    ShowSnackBar sSB = ShowSnackBar(context: context);
    return Scaffold(
      // AppBar with the title "Añadir Incidencias" and a turquoise background color
      appBar: AppBar(
        title: const Text(
          "Añadir Incidencias",
          style: TextStyle(
              fontFamily: AutofillHints.addressCity,
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: const Color.fromRGBO(2, 169, 218, 1),
      ),

      // Body of the Scaffold, created by calling the private _formContainer method
      body: _formContainer(context),

      // Drawer of the Scaffold, a MenuLateral widget
      drawer: const MenuLateral(),

      // FloatingActionButton of the Scaffold, an IconButton with a "qr_code_2_outlined" icon
      floatingActionButton: IconButton(
        icon: const Icon(Icons.qr_code_2_outlined),
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(Color(cAplication.medio))),
        color: Colors.white,
        tooltip: "Añadir Incidencia con Código QR",
        iconSize: 40,
        onPressed: () {
          _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
              context: context,
              onCode: (code) {
                Future.microtask(() async {
                  try {
                    context
                        .read<StudentForm>()
                        .setStudent(int.parse(code.toString()))
                        .then(
                            (value) =>
                                sSB.showSnackBarMessage(true, alumnoEncontrado),
                            onError: (error) {
                      sSB.showSnackBarMessage(false, alumnoNoEncontrado);
                      debugPrint("El error es: $error");
                    });
                  } catch (e) {
                    sSB.showSnackBarMessage(false, alumnoNoEncontrado);
                    debugPrint("Este es el catch del qr scanner dialog$e");
                  }
                });
              });
        },
      ),
    );
  }

  /// Muestra un diálogo para escanear un código QR y actualiza el estado con el código escaneado.
  ///
  /// Esta función utiliza el [_qrBarCodeScannerDialogPlugin] para mostrar un diálogo
  /// que permite al usuario escanear un código QR. Cuando se escanea un código, la función
  /// llama a la función [showSnackBar] para mostrar un snackbar con el código escaneado.
  /// Después de eso, actualiza el estado del widget estableciendo la variable [_qrcode]
  /// con el código escaneado. Finalmente, imprime un mensaje con el código escaneado en la consola.
  ///
  /// El parámetro [context] es el contexto de construcción del widget.

  /// Retorna un widget [Card] que contiene un widget [Padding] que contiene un
  /// [ValueListenableBuilder]. El [ValueListenableBuilder] se utiliza para
  /// actualizar la interfaz de usuario cuando el valor de [_qrcodeNotifier] cambia.
  /// El widget [FormViewAddIncidents] se muestra dentro del [ValueListenableBuilder]
  /// y recibe el valor actual de [_qrcodeNotifier] como parámetro.
  ///
  /// El parámetro [context] es el contexto de construcción del widget.
  Widget _formContainer(BuildContext context) {
    // El widget Card representa una caja que tiene un efecto de sombra.
    return Card(
      child: Padding(
        // El widget Padding agrega relleno a su widget hijo.
        padding: const EdgeInsets.all(6.0),
        child: FormViewAddIncidents(),
      ),
    );
  }
}
