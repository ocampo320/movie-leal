import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:move_app/sign_up__module/domain/movie.dart';
import 'package:http/http.dart' as http;

import '../../app/data_source/api/api_source.dart';

class WelcomeServices  {


  static Future<Iterable<Movie>> getAllMovies() async {
    Uri url =
    Uri.parse("http://www.omdbapi.com/?s=Batman&page=2&apikey=564727fa");
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["Search"];
      print(list.toString());
      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies!");
    }
  }
}
