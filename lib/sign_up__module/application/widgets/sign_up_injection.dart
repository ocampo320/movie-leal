import 'package:flutter/material.dart';
import 'package:move_app/sign_up__module/application/widgets/sign_up_screen.dart';
import 'package:provider/provider.dart';

import '../../infraestructure/sign_up_provider.dart';

class SignUpInjection {
  static Widget injetion() {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SignUpProvider(),
      child: const SignUpScreen(),
    );
  }
}
