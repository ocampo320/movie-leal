class RecommendedResults {
  String? backdropPath;
  String? firstAirDate;
  List<int>? genreIds;
  int? id;
  String? name;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  dynamic voteAverage;
  int? voteCount;

  RecommendedResults(
      {this.backdropPath,
      this.firstAirDate,
      this.genreIds,
      this.id,
      this.name,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.voteAverage,
      this.voteCount});

  RecommendedResults.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    firstAirDate = json['first_air_date'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    name = json['name'];
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    data['first_air_date'] = this.firstAirDate;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    data['original_language'] = this.originalLanguage;
    data['original_name'] = this.originalName;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}
