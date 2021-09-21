import 'dart:convert';

import 'package:tmdb_filmes_series/model/movies/movie_results.dart';

class MovieResponseModel {
    MovieResponseModel({
        this.page,
        this.results,
        this.totalResults,
        this.totalPages,
    });

    int page;
    final List<MovieResult> results;
    final int totalResults;
    final int totalPages;

    factory MovieResponseModel.fromJson(String str) => MovieResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MovieResponseModel.fromMap(Map<String, dynamic> json) => MovieResponseModel(
        page: json["page"],
        results: List<MovieResult>.from(json["results"].map((x) => MovieResult.fromMap(x))),
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
    );

    Map<String, dynamic> toMap() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "total_results": totalResults,
        "total_pages": totalPages,
    };
}