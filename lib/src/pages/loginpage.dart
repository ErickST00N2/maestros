//import 'package:flutter/material.dart';
 //
 //void main() {
 //  runApp(const MyApp());
 //}
 //
 //class MyApp extends StatelessWidget {
 //  const MyApp({super.key});
 //
 //  @override
 //  Widget build(BuildContext context) {
 //    return MaterialApp(
 //      title: 'Android Alians',
 //      debugShowCheckedModeBanner: false,
 //      home: Login(),
 //    );
 //  }
 //}
 //
 //class Login extends StatefulWidget {
 //  @override
 //  _LoginState createState() => _LoginState();
 //}
 //
 //class _LoginState extends State<Login> {
 //  @override
 //  Widget build(BuildContext context) {
 //    return Scaffold(
 //      appBar: AppBar(
 //        title: const Text('Text Widget'),
 //      ),
 //      body: Center(
 //        child: Column(
 //          mainAxisAlignment: MainAxisAlignment.center,
 //          children: [
 //            ElevatedButton(
 //              onPressed: () {
 //                Navigator.push(
 //                  context,
 //                  MaterialPageRoute(
 //                    builder: (context) => LoginDemo1_03(),
 //                  ),
 //                );
 //              },
 //              child: Text('Simple Login'),
 //            ),
 //            ElevatedButton(
 //              onPressed: () {
 //                Navigator.push(
 //                  context,
 //                  MaterialPageRoute(
 //                    builder: (context) => LoginDemo2_03(),
 //                  ),
 //                );
 //              },
 //              child: Text('Sign in Login'),
 //            ),
 //            ElevatedButton(
 //              onPressed: () {
 //                Navigator.push(
 //                  context,
 //                  MaterialPageRoute(
 //                    builder: (context) => LoginDemo3_03(),
 //                  ),
 //                );
 //              },
 //              child: Text('Theming Login'),
 //            ),
 //            ElevatedButton(
 //              onPressed: () {
 //                Navigator.push(
 //                  context,
 //                  MaterialPageRoute(
 //                    builder: (context) => LoginDemo4_03(),
 //                  ),
 //                );
 //              },
 //              child: Text('Custom labels Login'),
 //            ),
 //            ElevatedButton(
 //              onPressed: () {
 //                Navigator.push(
 //                  context,
 //                  MaterialPageRoute(
 //                    builder: (context) => LoginDemo5_03(),
 //                  ),
 //                );
 //              },
 //              child: Text('Customization Login'),
 //            ),
 //          ],
 //        ),
 //      ),
 //    );
 //  }
 //}
 //
 //class LoginDemo1 extends StatefulWidget {
 //  const LoginDemo1({super.key});
 //
 //  @override
 //  State<LoginDemo1> createState() => _LoginDemo1State();
 //}
 //
 //class _LoginDemo1State extends State<LoginDemo1> {
 //  @override
 //  Widget build(BuildContext context) {
 //    return LoginScreen();
 //  }
 //}
 //
 //const users = const {
 //  'flutterpoint@gmail.com': '12345',
 //  'point@gmail.com': 'hunter',
 //};
 //
 //class LoginScreen extends StatelessWidget {
 //  Duration get loginTime => Duration(milliseconds: 2250);
 //
 //  Future<String?> _authUser(LoginData data) {
 //    debugPrint('Name: ${data.name}, Password: ${data.password}');
 //    return Future.delayed(loginTime).then((_) {
 //      if (!users.containsKey(data.name)) {
 //        return 'User not exists';
 //      }
 //      if (users[data.name] != data.password) {
 //        return 'Password does not match';
 //      }
 //      return null;
 //    });
 //  }
 //
 //  Future<String?> _signupUser(SignupData data) {
 //    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
 //    return Future.delayed(loginTime).then((_) {
 //      return null;
 //    });
 //  }
 //
 //  Future<String> _recoverPassword(String name) {
 //    debugPrint('Name: $name');
 //    return Future.delayed(loginTime).then((_) {
 //      if (!users.containsKey(name)) {
 //        return Future.error('User not exists');
 //      }
 //      return 'Recovery password';
 //    });
 //  }
 //
 //  @override
 //  Widget build(BuildContext context) {
 //    return FlutterLogin(
 //      title: 'POINT',
 //      logo: AssetImage('assets/images/Login_Screen_image.png'),
 //      onLogin: _authUser,
 //      onSignup: _signupUser,
 //      onSubmitAnimationCompleted: () {
 //        Navigator.pop(context);
 //      },
 //      onRecoverPassword: _recoverPassword,
 //    );
 //  }
 //}
 //
 //class LoginDemo2 extends StatefulWidget {
 //  const LoginDemo2({super.key});
 //
 //  @override
 //  State<LoginDemo2> createState() => _LoginDemo2State();
 //}
 //
 //class _LoginDemo2State extends State<LoginDemo2> {
 //  @override
 //  Widget build(BuildContext context) {
 //    return LoginScreen();
 //  }
 //}
 //
 //const users = const {
 //  'dribbble@gmail.com': '12345',
 //  'hunter@gmail.com': 'hunter',
 //};
 //
 //class LoginScreen extends StatelessWidget {
 //  Duration get loginTime => Duration(milliseconds: 2250);
 //
 //  Future<String?> _authUser(LoginData data) {
 //    debugPrint('Name: ${data.name}, Password: ${data.password}');
 //    return Future.delayed(loginTime).then((_) {
 //      if (!users.containsKey(data.name)) {
 //        return 'User not exists';
 //      }
 //      if (users[data.name] != data.password) {
 //        return 'Password does not match';
 //      }
 //      return null;
 //    });
 //  }
 //
 //  Future<String?> _signupUser(SignupData data) {
 //    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
 //    return Future.delayed(loginTime).then((_) {
 //      return null;
 //    });
 //  }
 //
 //  Future<String> _recoverPassword(String name) {
 //    debugPrint('Name: $name');
 //    return Future.delayed(loginTime).then((_) {
 //      if (!users.containsKey(name)) {
 //        return 'User not exists';
 //      }
 //      return 'Recovery password';
 //    });
 //  }
 //
 //  @override
 //  Widget build(BuildContext context) {
 //    return FlutterLogin(
 //      title: 'POINT',
 //      logo: AssetImage('assets/images/Login_Screen_image.png'),
 //      onLogin: _authUser,
 //      onSignup: _signupUser,
 //      loginProviders: <LoginProvider>[
 //        LoginProvider(
 //          icon: FontAwesomeIcons.google,
 //          label: 'Google',
 //          callback: () async {
 //            debugPrint('start google sign in');
 //            await Future.delayed(loginTime);
 //            debugPrint('stop google sign in');
 //            return null;
 //          },
 //        ),
 //        LoginProvider(
 //          icon: FontAwesomeIcons.facebookF,
 //          label: 'Facebook',
 //          callback: () async {
 //            debugPrint('start facebook sign in');
 //            await Future.delayed(loginTime);
 //            debugPrint('stop facebook sign in');
 //            return null;
 //          },
 //        ),
 //        LoginProvider(
 //          icon: FontAwesomeIcons.linkedinIn,
 //          label: 'Linkdin',
 //          callback: () async {
 //            debugPrint('start linkdin sign in');
 //            await Future.delayed(loginTime);
 //            debugPrint('stop linkdin sign in');
 //            return null;
 //          },
 //        ),
 //        LoginProvider(
 //          icon: FontAwesomeIcons.githubAlt,
 //          label: 'Github',
 //          callback: () async {
 //            debugPrint('start github sign in');
 //            await Future.delayed(loginTime);
 //            debugPrint('stop github sign in');
 //            return null;
 //          },
 //        ),
 //      ],
 //      onSubmitAnimationCompleted: () {
 //        Navigator.pop(context);
 //      },
 //      onRecoverPassword: _recoverPassword,
 //    );
 //  }
 //}
 //
 //class LoginDemo3 extends StatefulWidget {
 //  const LoginDemo3({super.key});
 //
 //  @override
 //  State<LoginDemo3> createState() => _LoginDemo3State();
 //}
 //
 //class _LoginDemo3State extends State<LoginDemo3> {
 //  @override
 //  Widget build(BuildContext context) {
 //    return LoginScreen();
 //  }
 //}
 //
 //class LoginScreen extends StatelessWidget {
 //  @override
 //  Widget build(BuildContext context) {
 //    return FlutterLogin(
 //      title: 'POINT',
 //      logo: AssetImage('assets/images/Login_Screen_image.png'),
 //      onLogin: (LoginData data) {
 //        return Future.value('Successful login');
 //      },
 //      onSubmitAnimationCompleted: () {
 //        Navigator.pop(context);
 //      },
 //      onRecoverPassword: (String email) {
 //        return Future.value('Password recovery email sent');
 //      },
 //    );
 //  }
 //}
 //
 //class LoginDemo4 extends StatefulWidget {
 //  const LoginDemo4({super.key});
 //
 //  @override
 //  State<LoginDemo4> createState() => _LoginDemo4State();
 //}
 //
 //class _LoginDemo4State extends State<LoginDemo4> {
 //  @override
 //  Widget build(BuildContext context) {
 //    return LoginScreen();
 //  }
 //}
 //
 //class LoginScreen extends StatelessWidget {
 //  @override
 //  Widget build(BuildContext context) {
 //    return FlutterLogin(
 //      title: 'Sistema integral de incidencias',
 //      logo: AssetImage('assets/svg/logo.png'),
 //      onLogin: (LoginData data) {
 //        if (data.name == 'exampleUser' && data.password == 'examplePassword') {
 //          return Future.value('Login successful');
 //        } else {
 //          return Future.value('Login failed');
 //        }
 //      },
 //      onSubmitAnimationCompleted: () {
 //        Navigator.pop(context);
 //      },
 //      onRecoverPassword: (String email) async {},
 //      messages: LoginMessages(
 //        userHint: 'User',
 //        passwordHint: 'Pass',
 //        confirmPasswordHint: 'Confirm',
 //        loginButton: 'LOG IN',
 //        signupButton: 'REGISTER',
 //        forgotPasswordButton: 'Forgot Pass?',
 //        recoverPasswordButton: 'HELP ME',
 //        goBackButton: 'GO BACK',
 //        confirmPasswordError: 'Not match!',
 //        recoverPasswordDescription:
 //            'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
 //        recoverPasswordSuccess: 'Password rescued successfully',
 //      ),
 //    );
 //  }
 //}
 //
 //class LoginDemo5 extends StatefulWidget {
 //  const LoginDemo5({super.key});
 //
 //  @override
 //  State<LoginDemo5> createState() => _LoginDemo5State();
 //}
 //
 //class _LoginDemo5State extends State<LoginDemo5> {
 //  @override
 //  Widget build(BuildContext context) {
 //    return LoginScreen();
 //  }
 //}
 //
 //class LoginScreen extends StatelessWidget {
 //  @override
 //  Widget build(BuildContext context) {
 //    final inputBorder = BorderRadius.vertical(
 //      bottom: Radius.circular(10.0),
 //      top: Radius.circular(20.0),
 //    );
 //
 //    return FlutterLogin(
 //      title: 'POINT',
 //      logo: AssetImage('assets/images/Login_Screen_image.png'),
 //      onLogin: (LoginData data) {
 //        return Future.value('Login successful');
 //      },
 //      onSubmitAnimationCompleted: () {
 //        Navigator.pop(context);
 //      },
 //      onRecoverPassword: (String email) {
 //        return Future.value('Password recovery email sent');
 //      },
 //      theme: LoginTheme(
 //        primaryColor: Colors.teal,
 //        accentColor: Colors.yellow,
 //        errorColor: Colors.deepOrange,
 //        titleStyle: TextStyle(
 //          color: Colors.greenAccent,
 //          fontFamily: 'Quicksand',
 //          letterSpacing: 4,
 //        ),
 //        bodyStyle: TextStyle(
 //          fontStyle: FontStyle.italic,
 //          decoration: TextDecoration.underline,
 //        ),
 //        textFieldStyle: TextStyle(
 //          color: Colors.orange,
 //          shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
 //        ),
 //        buttonStyle: TextStyle(
 //          fontWeight: FontWeight.w800,
 //          color: Colors.yellow,
 //        ),
 //        cardTheme: CardTheme(
 //          color: Colors.yellow.shade100,
 //          elevation: 5,
 //          margin: EdgeInsets.only(top: 15),
 //          shape: ContinuousRectangleBorder(
 //              borderRadius: BorderRadius.circular(100.0)),
 //        ),
 //        inputTheme: InputDecorationTheme(
 //          filled: true,
 //          fillColor: Colors.purple.withOpacity(.1),
 //          contentPadding: EdgeInsets.zero,
 //          errorStyle: TextStyle(
 //            backgroundColor: Colors.orange,
 //            color: Colors.white,
 //          ),
 //          labelStyle: TextStyle(fontSize: 12),
 //          enabledBorder: UnderlineInputBorder(
 //            borderSide: BorderSide(color: Colors.blue.shade700, width: 4),
 //            borderRadius: inputBorder,
 //          ),
 //          focusedBorder: UnderlineInputBorder(
 //            borderSide: BorderSide(color: Colors.blue.shade400, width: 5),
 //            borderRadius: inputBorder,
 //          ),
 //          errorBorder: UnderlineInputBorder(
 //            borderSide: BorderSide(color: Colors.red.shade700, width: 7),
 //            borderRadius: inputBorder,
 //          ),
 //          focusedErrorBorder: UnderlineInputBorder(
 //            borderSide: BorderSide(color: Colors.red.shade400, width: 8),
 //            borderRadius: inputBorder,
 //          ),
 //          disabledBorder: UnderlineInputBorder(
 //            borderSide: BorderSide(color: Colors.grey, width: 5),
 //            borderRadius: inputBorder,
 //          ),
 //        ),
 //        buttonTheme: LoginButtonTheme(
 //          splashColor: Colors.purple,
 //          backgroundColor: Colors.pinkAccent,
 //          highlightColor: Colors.lightGreen,
 //          elevation: 9.0,
 //          highlightElevation: 6.0,
 //          shape: BeveledRectangleBorder(
 //            borderRadius: BorderRadius.circular(10),
 //          ),
 //        ),
 //      ),
 //    );
 //  }
 //}
 //