import 'package:flutter/material.dart';
import 'package:maestros/src/layouts/util/colores.dart';
import 'package:maestros/src/router/routes.dart';
import 'package:maestros/src/services/auth.dart';
import 'package:provider/provider.dart';

class ShowOptionUser extends StatelessWidget {
  const ShowOptionUser({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionCondition = ListBody(
      children: <Widget>[
        ListTile(
          title: const Text('Registrar'),
          leading: Icon(color: Color(ColoresApp.fuerte3), Icons.login),
          onTap: () => Routes.showScreen(context, '/login'),
        ),
        ListTile(
          title: const Text('Iniciar Sesión'),
          leading: Icon(color: Color(ColoresApp.fuerte3), Icons.login),
          onTap: () => Routes.showScreen(context, '/login'),
        ),
      ],
    );
    return Consumer<AuthService>(
      builder: (context, AuthService authService, child) {
        switch (authService.status) {
          case AuthStatus.Uninitialized:
            return sessionCondition;
          case AuthStatus.Authenticated:
            return ListTile(
              title: const Text('Cerrar Sesión'),
              leading: Icon(color: Color(ColoresApp.fuerte3), Icons.login),
              onTap: () {
                authService.signOut();
                Navigator.pushNamed(context, '/login');
              },
            );
          case AuthStatus.Unauthenticated:
            return sessionCondition;
          case AuthStatus.Authenticating:
            return const ListTile();
          // default:
          //   return const ListTile();
        }
      },
    );
  }
}
