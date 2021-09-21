import 'dart:convert';

import 'package:tmdb_filmes_series/model/trend/trending_results.dart';

class TrendingResponseModel {

    int page;
    final List<TrendingResult> results;
    final int totalPages;
    final int totalResults;

    TrendingResponseModel({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });    

    factory TrendingResponseModel.fromJson(String str) => TrendingResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TrendingResponseModel.fromMap(Map<String, dynamic> json) => TrendingResponseModel(
        page: json["page"],
        results: List<TrendingResult>.from(json["results"].map((x) => TrendingResult.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toMap() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

