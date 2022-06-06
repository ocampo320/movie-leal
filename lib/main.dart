import 'package:flutter/material.dart';
import 'package:move_app/sign_up__module/application/widgets/sign_up_screen.dart';
import 'package:move_app/utils/colors.dart';
import 'package:move_app/welcome_module/application/welcome_screen.dart';

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
        primarySwatch: Colors.blue,
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
        '/home': (BuildContext context) =>  Scaffold(
              body: const HomeScreen(),appBar: AppBar(centerTitle: true,actions: [IconButton(onPressed: (){}, icon:  Icon(Icons.settings,color: MoveColor.grey,), )],   backgroundColor: Colors.black,  title: Text('Home', ),),
            ),
      },
    );
  }
}
