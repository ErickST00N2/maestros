import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:maestros/src/layouts/util/info.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return // Créditos del pie de página de la aplicación
        Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: AutoSizeText.rich(
        TextSpan(
          children: [
            const TextSpan(
              text:
                  '© 2024 Erick González Cortes. Todos los derechos reservados.',
              style: TextStyle(color: Colors.black, fontSize: 8),
            ),
            TextSpan(
              text: InfoAplication().versionApp,
              style: const TextStyle(color: Colors.black, fontSize: 8),
            ),
            TextSpan(
              text: ' Ver licencias del software',
              style: TextStyle(
                  color: Colors.blue.shade900,
                  decorationStyle: TextDecorationStyle.dotted,
                  fontSize: 8),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  showDialog(
                    context: context,
                    builder: (_) => AboutDialog(
                      applicationName:
                          '${InfoAplication().nameApp}\n${InfoAplication().nameSubApp}',
                      applicationVersion: InfoAplication().versionApp,
                      applicationIcon: Icon(Icons.credit_card),
                      applicationLegalese:
                          '© 2024 ${InfoAplication().nameDeveloper}. Todos los derechos reservados.',
                    ),
                  );
                },
            ),
          ],
        ),
        maxLines: 3,
      ),
    );
  }
}
