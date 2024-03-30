import 'package:flutter/material.dart';
import 'package:maestros/src/providers/user.dart';

import 'package:maestros/src/router/routes.dart';
import 'package:maestros/src/util/colores.dart';
import 'package:maestros/src/widgets/menu/show_option_user.dart';
import 'package:provider/provider.dart';

@immutable
class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: _buildDrawerContent(context),
    );
  }
/*
  /// Carga los datos del maestro.
  ///
  /// Esta función obtiene el objeto [Maestro] del [BuildContext] y lo utiliza
  /// para cargar los datos del maestro utilizando el método [getMaestroData].
  /// Si ocurre algún error, se muestra un mensaje de error en la consola.
  /// Si la operación es exitosa, se muestra un mensaje de depuración indicando
  /// que los datos del maestro se están cargando.
  Future<void> loadMaestroData(BuildContext context) async {
    try {
      // Obtiene el objeto Maestro del BuildContext
      Maestro maestro = Provider.of<Maestro>(context, listen: true);
      // Carga los datos del maestro utilizando el objeto Maestro y el usuario de Firebase
      await maestro.getMaestroData(maestro.authService.firebaseUser);
      // HACK: #2 Por ahora estamos utilizando este mensaje de depuración
      debugPrint(
          'Cargando datos del maestro el archivo menu_lateral... de loadMaestroData');
    } catch (e) {
      // Si ocurre algún error, se muestra un mensaje con el error en la consola
      debugPrint('Error al cargar los datos del maestro: $e');
    }
  }*/

  Widget _buildDrawerContent(BuildContext _) {
    //Maestro maestro = Provider.of<Maestro>(_, listen: true);

    //_.read<AuthService>().firebaseUser!.reload();
    //_.read<Maestro>().getMaestroData(_.read<AuthService>().firebaseUser);
    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Color(ColoresApp.fuerte3),
          ),
          accountName: Text(_.watch<Users>().nombre),
          accountEmail: Text(_.watch<Users>().correo),
          currentAccountPicture: CircleAvatar(
            backgroundImage: _.watch<Users>().getPhotoURL(),
          ),
        ),
        ListBody(
          children: [
            ListTile(
              title: const Text("Inicio"),
              leading: Icon(color: Color(ColoresApp.fuerte3), Icons.home),
              onTap: () => Routes.showScreen(_, ''),
            ),
            ListTile(
              title: const Text("Datos del profesor"),
              leading:
                  Icon(color: Color(ColoresApp.fuerte3), Icons.credit_card),
              onTap: () => Routes.showScreen(_, 'view_data_teacher'),
            ),
            ExpansionTile(
              title:
                  const Text('Incidencias y Asistencias'), // Título del grupo
              leading: Icon(
                  color: Color(ColoresApp().fuerte),
                  Icons.event_note), // Icono del grupo

              // Cuerpo del grupo
              children: [
                // Subelementos del grupo
                ListTile(
                  title: const Text("Lista de incidencias"),
                  leading: Icon(
                      color: Color(ColoresApp.fuerte3),
                      Icons.list_alt_outlined),
                  onTap: () {
                    Routes.showScreen(_, 'view_incidents');
                  },
                ),
                ListTile(
                  title: const Text("Añadir incidencias"),
                  leading:
                      Icon(color: Color(ColoresApp.fuerte3), Icons.add_box),
                  onTap: () => Routes.showScreen(_, 'add_incidents'),
                ),
                ListTile(
                  title: const Text("Registrar Asistencia"),
                  leading: Icon(
                      color: Color(ColoresApp.fuerte3), Icons.barcode_reader),
                  onTap: () => Routes.showScreen(_, 'register_attendance'),
                ),
              ],
            ),
            ListTile(
              title: const Text("Tutorial"),
              leading:
                  Icon(color: Color(ColoresApp.fuerte3), Icons.video_library),
              onTap: () => Routes.showScreen(_, 'tutorial'),
            ),
            ListTile(
              title: const Text("Créditos"),
              leading: Icon(color: Color(ColoresApp.fuerte3), Icons.info),
              onTap: () => Routes.showScreen(_, "about"),
            ),
            const ShowOptionUser(),
          ],
        ),
        const SizedBox(
          height: 20,
          width: double.infinity,
        ),
        const Divider(
          height: 20,
          thickness: 1,
          indent: 0,
          endIndent: 0,
          color: Colors.black38,
        ),
      ],
    );
  }
}


/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:incidencias/src/pages/login.dart';
import 'package:incidencias/src/services/auth.dart';
import 'package:incidencias/src/services/maestro.dart';
import 'package:provider/provider.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({super.key});

  @override
  State<MenuLateral> createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  String _accountName = 'Cargando...';
  String _accountEmail = 'Cargando...';
  String _especialidad = 'Cargando...';
  String _photoURL =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';

  @override
  void initState() {
    super.initState();
    loadMaestroData();
  }

  void loadMaestroData() async {
    final maestroData = Provider.of<Maestro>(context, listen: false);
    await maestroData.getMaestroData(maestroData.authService.firebaseUser);
    setState(() {
      _accountName = maestroData.nombre;
      _accountEmail = maestroData.correo;
      _especialidad = maestroData.especialidad;
      _photoURL = maestroData.photoURL;
    });
    print('esto es lo que tiene el maestroData.nombre:'+maestroData.nom);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color(ColoresApp.fuerte3),
            ),
            accountName: Text(_accountName),
            accountEmail: Text(_accountEmail),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(_photoURL),
            ),
          ),
          ListBody(
            children: [
              ListTile(
                title: const Text("Inicio"),
                leading: const Icon(color: Color(ColoresApp.fuerte3), Icons.home),
                onTap: () => showScreen(context, 'Home'),
              ),
              ListTile(
                title: const Text("Datos del profesor"),
                leading:
                    const Icon(color: Color(ColoresApp.fuerte3), Icons.library_books),
                onTap: () => showScreen(context, 'View_Data_Teacher'),
              ),
              ListTile(
                title: const Text("Lista de incidencias"),
                leading: const Icon(color: Color(ColoresApp.fuerte3), Icons.list),
                onTap: () => showScreen(context, 'List_Incidents'),
              ),
              ListTile(
                title: const Text("Añadir incidencias"),
                leading: const Icon(color: Color(ColoresApp.fuerte3), Icons.add_box),
                onTap: () => showScreen(context, 'Add_Incidents'),
              ),
              ListTile(
                title: const Text("Tutorial"),
                leading:
                    const Icon(color: Color(ColoresApp.fuerte3), Icons.video_library),
                onTap: () => showScreen(context, 'Tutorial'),
              ),
              ListTile(
                title: const Text("Créditos"),
                leading: const Icon(color: Color(ColoresApp.fuerte3), Icons.info),
                onTap: () => showScreen(context, "About"),
              ),
              showOptionUser(context),
            ],
          ),
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.black38,
          ),
        ],
      ),
    );
  }

  void showScreen(BuildContext context, String routeName) {
    if (routeName == "Login") {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const Login(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(31.0, -3.0);
            var end = Offset.zero;
            var curve = Curves.easeInOutCubicEmphasized;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    } else {
      Navigator.of(context).popAndPushNamed('/$routeName');
    }
  }

  Widget showOptionUser(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, AuthService authService, child) {
        switch (authService.status) {
          case AuthStatus.Uninitialized:
            return ListTile(
              title: const Text("Iniciar Sesión"),
              leading: const Icon(color: Color(ColoresApp.fuerte3), Icons.login),
              onTap: () => showScreen(context, "Login"),
            );
          case AuthStatus.Authenticated:
            return ListTile(
              title: const Text("Cerrar Sesión"),
              leading: const Icon(color: Color(ColoresApp.fuerte3), Icons.login),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/Login');
              },
            );
          case AuthStatus.Unauthenticated:
            return ListTile(
              title: const Text("Iniciar Sesión"),
              leading: const Icon(color: Color(ColoresApp.fuerte3), Icons.login),
              onTap: () => showScreen(context, "Login"),
            );
          default:
            return const ListTile();
        }
      },
    );
  }
}*/
