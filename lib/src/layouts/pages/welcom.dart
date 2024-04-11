import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maestros/src/layouts/pages/login.dart';
import 'package:maestros/src/layouts/pages/my_home_page.dart';
import 'package:maestros/src/services/auth.dart';
import 'package:provider/provider.dart';

/// Pantalla de bienvenida que se muestra al iniciar la aplicación.
class WelcomeScreen extends StatefulWidget {
  /// Constructor de la clase.
  const WelcomeScreen({required this.context, super.key});

  /// Contexto
  final BuildContext context;

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

/// Estado de la pantalla de bienvenida.
class WelcomeScreenState extends State<WelcomeScreen> {
  double _opacity = 0;

  final double _containerHeight = 200;
  final double _containerWidth = 200;

  @override
  void initState() {
    super.initState();
    // Animación de entrada
    Timer(const Duration(microseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Animación de salida y navegación a la siguiente pantalla
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _opacity = 0.0;
      });
      Timer(const Duration(milliseconds: 800), () {
        Navigator.of(context).push(const Welcom() as Route<Object?>);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(milliseconds: 800),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF02A9DA),
                Color(0xFF069BDF),
                Color(0xFF0F84D1),
                Color(0xFF186DDE),
              ],
            ),
          ),
          child: Center(
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 800),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                height: _containerHeight,
                width: _containerWidth,
                curve: Curves.easeOutQuad,
                child: Image.asset(
                  'assets/svg/credencialesqr_imagotipo_azul.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Clase que representa la pantalla de bienvenida.
class Welcom extends StatefulWidget {
  /// Crea una instancia de [Welcom].
  const Welcom({super.key});

  /// Crea una instancia de [Welcom].
  @override
  WelcomState createState() => WelcomState();
}

/// Estado de la pantalla de bienvenida.
class WelcomState extends State<Welcom> {
  double _opacity = 0;

  final double _containerHeight = 200;
  final double _containerWidth = 200;

  @override
  void initState() {
    super.initState();
    // Animación de entrada
    Timer(const Duration(microseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Animación de salida y navegación a la siguiente pantalla
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _opacity = 0.0;
      });
      Timer(const Duration(milliseconds: 800), () {
        Navigator.of(context).push(
          Consumer<AuthService>(
            // Utiliza el estado de autenticación para determinar qué página
            // mostrar.
            builder: (context, AuthService authService, child) {
              switch (authService.status) {
                case AuthStatus.Uninitialized:
                  debugPrint('${authService.status}');
                  return const Login();
                case AuthStatus.Authenticated:
                  debugPrint('${authService.status}');
                  return const MyHomePage();
                case AuthStatus.Unauthenticated:
                  debugPrint('${authService.status}');
                  return const Login();
                case AuthStatus.Authenticating:
                  debugPrint('${authService.status}');
                  return const CircularProgressIndicator.adaptive();
              }
            },
          ) as Route<Object?>,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(milliseconds: 800),
        child: ColoredBox(
          color: Colors.white,
          child: Center(
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 800),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                height: _containerHeight,
                width: _containerWidth,
                curve: Curves.easeOutQuad,
                child: SvgPicture.asset(
                  'assets/svg/logocbtis.svg',
                  width: 900, // Ancho deseado en píxeles
                  height: 900, // Alto deseado en píxeles

                  placeholderBuilder: (context) => LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) =>
                            SvgPicture.asset(
                      'assets/svg/logocbtis.svg',
                      width: constraints.maxWidth, // Ancho máximo disponible
                      height: constraints.maxHeight, // Alto máximo disponible
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
