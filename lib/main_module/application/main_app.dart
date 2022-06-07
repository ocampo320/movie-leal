import 'package:flutter/material.dart';
import 'package:move_app/main_module/welcome_module/application/welcome_screen.dart';

class MercaApp extends StatelessWidget {
  const MercaApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return createApp();
  }
}

MaterialApp createApp() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    localizationsDelegates: const [],
    supportedLocales: const [
      Locale('es'),
    ],
    title: 'Move app',
    home: WelcomeScreen(),
  );
}
