import 'package:flutter/material.dart';

import '../main_module/welcome_module/application/welcome_screen.dart';
import '../sign_up__module/application/widgets/sign_up_screen.dart';

class PocketWalletApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/signUp': (context) => SignUpScreen(),
      },
    );
  }
}
