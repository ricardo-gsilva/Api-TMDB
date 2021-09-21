import 'dart:convert';
import 'package:tmdb_filmes_series/model/trend/trending_results.dart';

class TrendingDetailModel {  

    final bool adult;
    final String backdropPath;
    final List<int> genreIds;
    final int id;
    final OriginalLanguageModel originalLanguage;
    final String originalTitle;
    final String overview;
    final String posterPath;
    final DateTime releaseDate;
    final String title;
    final bool video;
    final double voteAverage;
    final int voteCount;
    final double popularity;
    final DateTime firstAirDate;
    final String name;
    final List<String> originCountry;
    final String originalName;

    TrendingDetailModel({
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
        this.popularity,
        this.firstAirDate,
        this.name,
        this.originCountry,
        this.originalName,
    });

    factory TrendingDetailModel.fromJson(String str) => TrendingDetailModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TrendingDetailModel.fromMap(Map<String, dynamic> json) => TrendingDetailModel(
        adult: json["adult"] == null ? null : json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"] == null ? null : json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        title: json["title"] == null ? null : json["title"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        popularity: json["popularity"].toDouble(),
        firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
        name: json["name"] == null ? null : json["name"],
        originCountry: json["origin_country"] == null ? null : List<String>.from(json["origin_country"].map((x) => x)),
        originalName: json["original_name"] == null ? null : json["original_name"],
    );

    Map<String, dynamic> toMap() => {
        "adult": adult == null ? null : adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle == null ? null : originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "release_date": releaseDate == null ? null : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title == null ? null : title,
        "video": video == null ? null : video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "popularity": popularity,
        "first_air_date": firstAirDate == null ? null : "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "name": name == null ? null : name,
        "origin_country": originCountry == null ? null : List<dynamic>.from(originCountry.map((x) => x)),
        "original_name": originalName == null ? null : originalName,
    };
}


