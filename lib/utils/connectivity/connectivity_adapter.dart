import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';


import '../../app/settings/application.dart';
import 'connectivity.dart';

@Injectable(as: Connectivity)
class ConnectivityAdapter implements Connectivity {
  @override
  Future<bool> isConnected() async {
    if (kIsWeb) {
      try {
        var headers = <String, String>{};
        var response = await http.get(
          Uri.parse(Application().appSettings.healthUrl),
          headers: headers,
        );
        return response.statusCode >= 200 && response.statusCode < 300;
      } catch (e) {
        log(e.toString(), name: 'isConnected', error: e);
        return false;
      }
    } else {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        }
      } on SocketException catch (e) {
        log(e.message, name: 'isConnected', error: e);
      }
      return false;
    }
  }
}
