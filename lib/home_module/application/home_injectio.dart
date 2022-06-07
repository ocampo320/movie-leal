import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../application/widgets/t.dart';
import '../infraestructure/home_provider.dart';

class HomeInjection {
  HomeInjection._();

  static Widget injection() {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: const HomeScreen(),
    );
  }
}
