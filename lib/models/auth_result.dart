class AuthResults {
  String? user;
  String? password;

  AuthResults({this.user, this.password});

  AuthResults.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['password'] = this.password;
    return data;
  }
}
