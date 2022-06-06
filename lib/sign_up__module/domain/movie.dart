class Movie {


  late final String? imdbId;
  late  final String? poster;
  late final String? title;
   late final String? year;

  Movie({this.imdbId, this.title, this.poster, this.year});



  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        imdbId: json["imdbID"],
        poster: json["Poster"],
        title: json["Title"],
        year: json["Year"]
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imdbID'] = imdbId;
    data['Poster'] = poster;
    data['Title'] = title;
    data['Year'] = year;
    return data;
  }
}
