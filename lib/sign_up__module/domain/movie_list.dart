import 'movie.dart';

class MovieList {
  static MovieList? singleton;

  late final List<Movie>? movie;


  MovieList.initial({this.movie});

  factory MovieList(){
    if (singleton == null) {
      singleton = MovieList.initial();
    }
    return singleton!;
  }

  MovieList.fromJson(Map<String, dynamic> json) {
    movie?.add( Movie.fromJson(json));


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movie'] = this.movie?.map((v) => v.toJson()).toList();
    return data;
  }
}
