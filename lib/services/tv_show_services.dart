import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:move_app/models/tv_show.dart';

import '../app/settings/end_points.dart';
import '../models/recommended.dart';

class TvShowServices {
  static Future<TvShow> getTvShowPopular() async {
    Uri url = Uri.parse(
        '${EndpointsMove.baseUrl}/tv/popular?api_key=${EndpointsMove.apiKey}&language=en-US&page=1');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      List list = result["results"];
      print("--------------------------------------------------");
      print(list.toString());
      return TvShow.fromJson(result);
    } else {
      throw Exception("Failed to load TvShow!");
    }
  }

  static Future<Recommended> getTvShowRecommended() async {
    Uri url = Uri.parse(
        '${EndpointsMove.baseUrl}/tv/top_rated?api_key=${EndpointsMove.apiKey}&language=en-US&page=1');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      List list = result["results"];
      print("--------------------------------------------------");
      print(list.toString());
      return Recommended.fromJson(result);
    } else {
      throw Exception("Failed to load TvShow recommended!");
    }
  }
}
