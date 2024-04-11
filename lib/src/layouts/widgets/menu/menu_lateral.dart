import 'package:flutter/material.dart';
import 'package:maestros/src/layouts/util/colores.dart';
import 'package:maestros/src/layouts/widgets/menu/show_option_user.dart';
import 'package:maestros/src/layouts/widgets/util/footer_widget/footer_widget.dart';
import 'package:maestros/src/providers/user.dart';
import 'package:maestros/src/router/routes.dart';
import 'package:provider/provider.dart';

/// El widget `MenuLateral` representa el menú lateral de la aplicación.
@immutable
class MenuLateral extends StatelessWidget {
  /// Constructor de `MenuLateral`.
  ///
  /// [key] es una llave para identificar de manera única este widget.
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: _buildDrawerContent(context),
    );
  }

  /// Método privado para construir el contenido del drawer.
  Widget _buildDrawerContent(BuildContext context) {
    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Color(ColoresApp.fuerte3),
          ),
          accountName: Text(context.watch<UserModel>().nombre),
          accountEmail: Text(context.watch<UserModel>().correo),
          currentAccountPicture: CircleAvatar(
            backgroundImage: context.watch<UserModel>().getPhotoURL(context),
          ),
        ),
        ListBody(
          children: [
            ListTile(
              title: const Text('Inicio'),
              leading: Icon(
                color: Color(ColoresApp.fuerte3),
                Icons.home,
              ),
              onTap: () => Routes.showScreen(context, ''),
            ),
            ListTile(
              title: const Text('Datos del profesor'),
              leading: Icon(
                color: Color(ColoresApp.fuerte3),
                Icons.credit_card,
              ),
              onTap: () => Routes.showScreen(context, 'view_data_teacher'),
            ),
            ExpansionTile(
              title: const Text('Incidencias y Asistencias'),
              leading: Icon(
                color: Color(ColoresApp().fuerte),
                Icons.event_note,
              ),
              children: [
                ListTile(
                  title: const Text('Lista de incidencias'),
                  leading: Icon(
                    color: Color(ColoresApp.fuerte3),
                    Icons.list_alt_outlined,
                  ),
                  onTap: () {
                    Routes.showScreen(context, 'view_incidents');
                  },
                ),
                ListTile(
                  title: const Text('Añadir incidencias'),
                  leading: Icon(
                    color: Color(ColoresApp.fuerte3),
                    Icons.add_box,
                  ),
                  onTap: () => Routes.showScreen(context, 'add_incidents'),
                ),
                ListTile(
                  title: const Text('Registrar Asistencia'),
                  leading: Icon(
                    color: Color(ColoresApp.fuerte3),
                    Icons.barcode_reader,
                  ),
                  onTap: () =>
                      Routes.showScreen(context, 'register_attendance'),
                ),
              ],
            ),
            ListTile(
              title: const Text('Tutorial'),
              leading: Icon(
                color: Color(ColoresApp.fuerte3),
                Icons.video_library,
              ),
              onTap: () => Routes.showScreen(context, 'tutorial'),
            ),
            ListTile(
              title: const Text('Créditos'),
              leading: Icon(
                color: Color(ColoresApp.fuerte3),
                Icons.info,
              ),
              onTap: () => Routes.showScreen(context, 'about'),
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
        const FooterWidget(),
      ],
    );
  }
}
