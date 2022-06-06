import 'dart:convert';

import 'package:move_app/sign_up__module/domain/movie.dart';
import 'package:http/http.dart' as http;

import '../../app/data_source/api/api_source.dart';

class SignUpServices extends ApiSource {
  SignUpServices(super.baseUrl, super.client, super.connectivity);

  Future<Iterable<dynamic>> _getAllMovies() async {
    Uri url =
        Uri.parse("http://www.omdbapi.com/?s=Batman&page=2&apikey=564727fa");

    return getApi(url, (value) {
      print("respuesta del api" + value.toString());
      final result = jsonDecode(value.body);
      Iterable list = result["Search"];
      print("------------>"+list.toString());
      return list;
    });
  }
}
