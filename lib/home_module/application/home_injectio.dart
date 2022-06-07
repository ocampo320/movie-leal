import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../infraestructure/home_provider.dart';
import 'home_screen.dart';

class HomeInjection {
  HomeInjection._();

  static Widget injection() {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: const HomeScreen(),
    );
  }
}
