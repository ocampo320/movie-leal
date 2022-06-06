import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:move_app/sign_up__module/domain/movie.dart';
import 'package:http/http.dart' as http;

import '../../app/data_source/api/api_source.dart';
import '../domain/movie_list.dart';

class SignUpServices  {


 static Future<List<Movie>> getAllMovies() async {

    List<Movie> lista=[];
    Uri url =
    Uri.parse("http://www.omdbapi.com/?s=Batman&page=2&apikey=564727fa");
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      List list = result["Search"];
      print(list.toString());

      list.map((movie) => Movie.fromJson(movie)).toList().forEach((element) {

        lista.add(element);

      });
    } else {
      throw Exception("Failed to load movies!");
    }
    return lista;
  }
}
