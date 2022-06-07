import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:move_app/sign_up__module/infraestructure/auth_input_controller.dart';

import '../models/auth.dart';

class AuthServices {
  static Future<bool> login() async {
    bool result = false;
    var getJson = await rootBundle.loadString('assets/login.json');
    var jsonResponse = json.decode(getJson);
    var data = Auth.fromJson(jsonResponse).results;
    data?.forEach((element) {
      if (element.user == AuthInputController.user.text &&
          element.password == AuthInputController.password.text) {
        result = true;
      }
    });
    return result;
  }
}
