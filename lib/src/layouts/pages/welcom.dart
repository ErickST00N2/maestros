//TODO: implement de ignore_for_file: avoid_print, library_private_types_in_public_api

// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:maestros/src/layouts/pages/login.dart';
import 'package:maestros/src/layouts/pages/my_home_page.dart';
import 'package:maestros/src/services/auth.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  final BuildContext context;
  const WelcomeScreen({super.key, required this.context});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _opacity = 0.0;

  final double _containerHeight = 200.0;
  final double _containerWidth = 200.0;

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
        //Navigator.of(context).pushNamed('/Home');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Welcom()));
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
                  'assets/svg/logo2.png',
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

class Welcom extends StatefulWidget {
  const Welcom({super.key});

  @override
  _WelcomState createState() => _WelcomState();
}

class _WelcomState extends State<Welcom> {
  double _opacity = 0.0;

  final double _containerHeight = 200.0;
  final double _containerWidth = 200.0;

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
        //Navigator.of(context).pushNamed('/Home');
        //Navigator.of(context).canPop();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Consumer<AuthService>(
            // Utiliza el estado de autenticación para determinar qué página mostrar.
            builder: (context, AuthService authService, child) {
              switch (authService.status) {
                case AuthStatus.Uninitialized:
                  print(authService.status);
                  return const Login(); // Muestra la pantalla de inicio de sesión
                case AuthStatus.Authenticated:
                  print(authService.status);
                  return const MyHomePage();
                //case AuthStatus.Authenticating:
                //print(authService.status);
                //return const CircularProgressIndicator(); // O algún otro widget de carga
                case AuthStatus.Unauthenticated:
                  print(authService.status);
                  return const Login(); // Muestra la pantalla de inicio de sesión
                default:
                  print(authService.status);
                  return WelcomeScreen(context: context);
              }
            },
          ),
        ));
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
          color: Colors.white,
          //decoration: const BoxDecoration(
          //  gradient: LinearGradient(
          //    colors:
          //    [
          //      Color(0xFF02A9DA),
          //      Color(0xFF069BDF),
          //      Color(0xFF0F84D1),
          //      Color(0xFF186DDE),
          //    ],
          //  ),
          //),
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
                  fit: BoxFit
                      .contain, // Ajusta la imagen dentro del espacio disponible

                  placeholderBuilder: (context) => LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return SvgPicture.asset(
                        'assets/svg/logocbtis.svg',
                        width: constraints.maxWidth, // Ancho máximo disponible
                        height: constraints.maxHeight, // Alto máximo disponible
                        fit: BoxFit
                            .contain, // Ajusta la imagen dentro del espacio disponible
                      );
                    },
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
