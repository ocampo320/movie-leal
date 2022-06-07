import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/move.dart';

class MovieService {
  static Future<List<Movie>> getAllMovies() async {
    List<Movie> lista = [];
    Uri url =
        Uri.parse("http://www.omdbapi.com/?s=Batman&page=2&apikey=564727fa");
    final response = await http.get(url);
    if (response.statusCode == 200) {
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
