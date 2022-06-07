import 'auth_result.dart';

class Auth {
  List<AuthResults>? results;

  Auth({this.results});

  Auth.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <AuthResults>[];
      json['results'].forEach((v) {
        results!.add(AuthResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
