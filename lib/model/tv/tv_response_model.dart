import 'dart:convert';

import 'package:tmdb_filmes_series/model/tv/tv_results.dart';

class TvResponseModel {
    TvResponseModel({
        this.page,
        this.results,
        this.totalResults,
        this.totalPages,
    });

    int page;
    final List<TvResult> results;
    final int totalResults;
    final int totalPages;

    factory TvResponseModel.fromJson(String str) => TvResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TvResponseModel.fromMap(Map<String, dynamic> json) => TvResponseModel(
        page: json["page"],
        results: List<TvResult>.from(json["results"].map((x) => TvResult.fromMap(x))),
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