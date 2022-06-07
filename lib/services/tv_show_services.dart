import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:move_app/models/tv_show.dart';

import '../app/settings/end_points.dart';

class TvShowServices {
  static Future<TvShow> getTvShow() async {
    var res;
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
    return res;
  }
}
