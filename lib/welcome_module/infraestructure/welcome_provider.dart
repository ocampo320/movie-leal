import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:move_app/welcome_module/infraestructure/welcome_services.dart';
import 'package:http/http.dart' as http;
class WelcomeProvider with ChangeNotifier, DiagnosticableTreeMixin {

  void getdata(){
    WelcomeServices.getAllMovies();
  }

}