import 'package:flutter/material.dart';
import 'package:move_app/main_module/welcome_module/application/welcome_screen.dart';
import 'package:provider/provider.dart';

import '../infraestructure/welcome_provider.dart';

class AddressInjection {
  static Widget injetion() {
    return ChangeNotifierProvider(
      create: (BuildContext context) => WelcomeProvider(),
      child: const WelcomeScreen(),
    );
  }
}
