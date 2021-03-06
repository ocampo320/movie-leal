import 'package:flutter/material.dart';
import 'package:move_app/main_module/welcome_module/application/welcome_screen.dart';
import 'package:move_app/sign_up__module/application/widgets/sign_up_screen.dart';
import 'package:move_app/sign_up__module/infraestructure/auth_input_controller.dart';
import 'package:move_app/utils/colors.dart';

import 'home_module/application/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie app',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
      home: const Scaffold(body: WelcomeScreen()),
      routes: {
        '/signUp': (BuildContext context) => const Scaffold(
              body: SignUpScreen(),
            ),
        '/home': (BuildContext context) => Scaffold(
            body: const HomeScreen(),
            appBar: AppBar(
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/signUp', (route) => false);
                    AuthInputController.password.text='';
                    AuthInputController.user.text='';

                  },
                  icon: Icon(
                    Icons.settings,
                    color: MoveColor.grey,
                  ),
                )
              ],
              backgroundColor: Colors.black,
              title: Text(
                'Home',
              ),
            )),
      },
    );
  }
}
