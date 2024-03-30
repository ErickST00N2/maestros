import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maestros/src/providers/list_incidents.dart';
import 'package:maestros/src/providers/register_class_attendance/provider_register_class_attendance.dart';
import 'package:maestros/src/providers/student_form_provider.dart';
import 'package:maestros/src/providers/user.dart';
import 'package:maestros/src/router/routes.dart';
import 'package:maestros/src/services/auth.dart';
import 'package:maestros/src/layouts/util/colores.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  final String nameApp = 'Sistema de reportes de incidencias';
  final ColoresApp cAplication = ColoresApp();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Users>(
          create: (_) => Users(),
        ),
        ChangeNotifierProvider<AuthService>(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider<ListIncidents>(
          create: (_) => ListIncidents(),
        ),
        ChangeNotifierProvider<StudentForm>(
          create: (_) => StudentForm(),
        ),
        ChangeNotifierProvider<ProviderRegisterClassAttendance>(
          create: (_) => ProviderRegisterClassAttendance(),
        ),
        ChangeNotifierProvider<RegisterClassAttendance>(
            create: (_) => RegisterClassAttendance())
      ],
      child: MaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        showSemanticsDebugger: false,
        title: nameApp,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Color(cAplication.medio),
          primaryColorLight: Color(cAplication.bajo),
          colorScheme: ColorScheme.light(
            primary: Color(cAplication.fuerte),
            onPrimary: Color(cAplication.fuerteMedio),
            secondary: Color(cAplication.fuerteMedio),
            onSecondary: Color(cAplication.fuerteMedio),
            tertiary: Color(cAplication.medio),
            primaryContainer: Colors.white,
            secondaryContainer: Colors.white,
            errorContainer: Color(cAplication.error),
            error: Color(cAplication.error),
            onError: const Color.fromARGB(255, 255, 0, 0),
          ),
          buttonTheme: const ButtonThemeData(
            colorScheme: ColorScheme.light(),
            buttonColor: Colors.white,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                color: Colors.white,
              ),
              foregroundColor: Color(cAplication.bajo),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          fontFamily: GoogleFonts.ptSerif().fontFamily,
        ),
        color: Color(cAplication.fuerteMedio),
        initialRoute: Routes.initialRoute,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
