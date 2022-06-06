import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:move_app/sign_up__module/infraestructure/sign_up_services.dart';

import '../domain/movie.dart';
import 'movie_data.dart';

class SignUpProvider with ChangeNotifier, DiagnosticableTreeMixin {





  void getdata() async {
    List<Movie>movie = [];
    SignUpServices.getAllMovies().then((value) {
      MovieData.listDataMovie=value;
    } );

  }

}