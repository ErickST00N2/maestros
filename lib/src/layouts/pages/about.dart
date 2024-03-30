import 'package:flutter/material.dart';
import 'package:maestros/src/layouts/util/colores.dart';
import 'package:maestros/src/layouts/util/info.dart';

import 'package:maestros/src/layouts/widgets/menu/menu_lateral.dart';
import 'package:maestros/src/layouts/widgets/util/footer_widget/footer_widget.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});
  final ColoresApp cAplication = ColoresApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuLateral(),
      appBar: AppBar(
        backgroundColor: cAplication.colorDelAppBar,
        title: const Text('Acerca de'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textAlign: TextAlign.justify,
              InfoAplication().nameApp,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'El Sistema de Credenciales QR es un proyecto desarrollado por el T.S.U. Erick González Cortes, un estudiante de Ingeniería en Tecnologías de La Información, especializado en Área Entornos Virtuales y Negocios Digitales, durante su periodo de estadías en la Universidad Tecnológica de Tlaxcala. Este sistema tiene como objetivo proporcionar un método eficiente y seguro para la gestión de credenciales mediante tecnología QR.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'El sistema de credenciales QR consta de tres aplicaciones móviles, cada una con su respectiva versión web. Además, incluye una aplicación de administración que está disponible exclusivamente en versión web. Esta solución proporciona una forma innovadora y práctica de gestionar credenciales, facilitando su creación, distribución y verificación a través de códigos QR.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Información de contacto:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Correo electrónico: erickst00n@gmail.com\nNúmero de contacto: 2471072688\nFacebook: https://www.facebook.com/erickstoon/\nDesarrollador: Erick Gonzalez Cortes\nAlumno: Erick Gonzalez Cortes\nAsesor de empresa: Ing José Alejandro Hernández Rivera\nAsesora académica: Dra. Sonia López Rodríguez',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const FooterWidget(),
    );
  }
}
