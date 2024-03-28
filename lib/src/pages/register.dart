//HACK: Por ahora estamos utilizando
// ignore_for_file: avoid_print para mejorar la depuración.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:maestros/src/services/auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _loading = false;
  bool _showPassword = false;

  // Controladores para los campos de texto de correo electrónico y contraseña.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late String _emailValue;
  late String _passwordValue;

  late FocusNode _emailFocus;
  late FocusNode _passwordFocus;
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();

    super.dispose();
  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    /// [size] - Es el tamaño de la pantalla que se obtiene del dispositivo.
    final size = MediaQuery.of(context).size;

    /// [maxWidthScreenCard] - Evaluamos la anchura de la pantalla para saber si
    /// nuestra credencial tendrá un ancho maximo de 700 pixeles o si sigue con
    /// el valor por defecto de 0.95.
    final maxWidthScreenCard =
        (size.width > 700.0) ? (600.0) : (size.width * 0.98);
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 60),
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xFF02A9DA),
              Color(0xFF069BDF),
              Color(0xFF0F84D1),
              Color(0xFF186DDE),
            ],
          )),
          child: Image.asset(
            'assets/svg/logo2.png',
            height: 200,
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.black38),
          child: Transform.translate(
            offset: const Offset(0, -50),
            child: Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: SizedBox(
                  width: maxWidthScreenCard,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, top: 260),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 30),
                      child: Form(
                        key: formKey,
                        child: Column(
                          /*No poner en max en caso de querer ver el container del login muy grande*/
                          // mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            // Campo de texto para el correo electrónico.
                            TextFormField(
                              focusNode: _emailFocus,
                              keyboardAppearance: Brightness.light,
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              validator: (value) {
                                if (value.toString().isEmpty) {
                                  return "¡Introduce tu correo!, ej: example@gmail.com";
                                } else {
                                  if (!value!.contains("@") &&
                                      !value.contains(".com")) {
                                    return 'Ingresa un correo valido.';
                                  }
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                //labelText: "Correo",
                                hintText: 'Correo@example.com',

                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                              onEditingComplete: () =>
                                  requestFocus(context, _passwordFocus),
                            ),
                            const SizedBox(
                              height: 40,
                            ),

                            // Campo de texto para la contraseña.
                            TextFormField(
                              focusNode: _passwordFocus,
                              controller: _passwordController,
                              keyboardAppearance: Brightness.light,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value!.length < 6) {
                                  return "¡Introduce tu contraseña!, debe tener al menos 6 caracteres.";
                                } else {
                                  if (value.toString().isEmpty) {
                                    return "¡Debes colocar tu contraseña!";
                                  }
                                }
                                return null;
                              },
                              obscureText: !_showPassword,
                              decoration: InputDecoration(
                                //labelText: "Contraseña",
                                prefixIcon: const Icon(Icons.lock_person),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _showPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                ),
                              ),
                              onEditingComplete: () =>
                                  requestFocus(context, _passwordFocus),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            FilledButton(
                              onPressed: _signUpButton,
                              style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(vertical: 15)),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                backgroundColor:
                                    MaterialStatePropertyAll(Color(0xFF069BDF)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder()),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text("Registrarme"),
                                  if (_loading)
                                    Container(
                                        width: 20,
                                        height: 20,
                                        margin: const EdgeInsets.only(left: 20),
                                        child: const CircularProgressIndicator(
                                          color: Colors.white,
                                        )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text("¿Ya estás Registrado?"),

                                // Botón para Registrarse
                                FilledButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.transparent),
                                      textStyle: MaterialStatePropertyAll(
                                          TextStyle(color: Color(0xFF0F84D1)))),
                                  onPressed: () => _showLoginPage(),
                                  child: const Text("Inicia Sesion"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  void _showLoginPage() {
    Navigator.of(context).pushNamed(
      "/login",
    );
  }

  void _signUpButton() async {
    if (formKey.currentState!.validate()) {
      if (!_loading) {
        setState(() {
          _loading = true;
        });
      } else {
        setState(() {
          _loading = false;
        });
      }

      // Obtiene los valores de los campos de texto.

      //String email = _emailController.text;
      //String password = _passwordController.text;
      formKey.currentState!.save();

      // Llama al método de inicio de sesión con correo electrónico y contraseña.
      //await AuthService.signInWithEmailAndPassword(email, password);
      User? user = await AuthService()
          .signUpWithEmailAndPassword(_emailValue, _passwordValue);

      if (user != null) {
        print(
            'El usuario $user esta autenticado y registrado satisfactoriamente');
        await Navigator.pushNamed(context, '/');
      } else {
        print('No se pude registrar el usuario');
      }
    }
  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
