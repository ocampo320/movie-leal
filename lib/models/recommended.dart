import 'package:move_app/models/recommended_result.dart';

class Recommended {
  int? page;
  List<RecommendedResults>? results;
  int? totalPages;
  int? totalResults;

  Recommended({this.page, this.results, this.totalPages, this.totalResults});

  Recommended.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <RecommendedResults>[];
      json['results'].forEach((v) {
        results!.add(new RecommendedResults.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}