import 'package:flutter/material.dart';
import 'package:maestros/src/layouts/pages/about.dart';
import 'package:maestros/src/layouts/pages/add_incidents.dart';
import 'package:maestros/src/layouts/pages/alum_incident.dart';
import 'package:maestros/src/layouts/pages/data_teacher.dart';
import 'package:maestros/src/layouts/pages/incident_list.dart';
import 'package:maestros/src/layouts/pages/login.dart';
import 'package:maestros/src/layouts/pages/my_home_page.dart';
import 'package:maestros/src/layouts/pages/register.dart';
import 'package:maestros/src/layouts/pages/register_class_attendance.dart';
import 'package:maestros/src/layouts/pages/tutorial.dart';
import 'package:maestros/src/layouts/pages/welcom.dart';
import 'package:maestros/src/services/auth.dart';

import 'package:provider/provider.dart';

class Routes {
  static const String initialRoute = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case '/about':
        return MaterialPageRoute(builder: (_) => AboutPage());
      case '/add_incidents':
        return _checkAuthAndNavigate(
          settings,
          AddIncidents(),
        );
      case '/register_attendance':
        return _checkAuthAndNavigate(
          settings,
          const RegisterClassAttendance(),
        );
      case '/alumn_incident':
        return _checkAuthAndNavigate(
          settings,
          const AlumnIncident(),
        );
      case '/view_incidents':
        return _checkAuthAndNavigate(
          settings,
          IncidentListPage(),
        );
      case '/login':
        return _checkAuthAndNavigate(settings, const Login());
      case '/register':
        return MaterialPageRoute(builder: (_) => const Register());
      case '/tutorial':
        return _checkAuthAndNavigate(
          settings,
          const Tutorial(),
        );
      case '/welcome':
        return MaterialPageRoute(
          builder: (_) => WelcomeScreen(context: _),
        );
      case '/view_data_teacher':
        return _checkAuthAndNavigate(
          settings,
          const DataTeacher(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Error 404'),
            ),
            body: Center(
              child: Text('Ruta no encontrada: ${settings.name}'),
            ),
          ),
        );
    }
  }

  static void showScreen(BuildContext context, String routeName) {
    if (routeName == "/login") {
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

  static Route<dynamic> _checkAuthAndNavigate(
    RouteSettings settings,
    Widget page,
  ) {
    return MaterialPageRoute(
      builder: (context) {
        final authService = Provider.of<AuthService>(context, listen: true);
        switch (authService.status) {
          case AuthStatus.Uninitialized:
            return const Welcom();
          case AuthStatus.Authenticating:
            // Muestra un indicador de carga mientras se determina el estado de autenticación
            return _buildLoadingScreen();
          case AuthStatus.Authenticated:
            // Si el usuario está autenticado, muestra la página solicitada
            return page;
          case AuthStatus.Unauthenticated:
            // Si el usuario no está autenticado, redirige a la página de inicio de sesión
            return const Login();
          default:
            // En caso de un estado no válido, muestra un mensaje de error
            return _buildErrorScreen();
        }
      },
    );
  }

  static Widget _buildLoadingScreen() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static Widget _buildErrorScreen() {
    return const Scaffold(
      body: Center(
        child: Text('Error: Estado de autenticación no válido'),
      ),
    );
  }
}
