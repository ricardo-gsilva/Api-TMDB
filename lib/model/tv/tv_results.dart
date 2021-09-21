import 'dart:convert';

class TvResult {
    TvResult({
        this.posterPath,
        this.popularity,
        this.id,
        this.backdropPath,
        this.voteAverage,
        this.overview,
        this.firstAirDate,
        this.originCountry,
        this.originalLanguage,
        this.voteCount,
        this.name,
        this.originalName,
    });

    final String posterPath;
    final double popularity;
    final int id;
    final String backdropPath;
    final double voteAverage;
    final String overview;
    final DateTime firstAirDate;
    final List<OriginCountry> originCountry;
    final OriginalLanguage originalLanguage;
    final int voteCount;
    final String name;
    final String originalName;

    factory TvResult.fromJson(String str) => TvResult.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TvResult.fromMap(Map<String, dynamic> json) => TvResult(
        posterPath: json["poster_path"],
        popularity: json["popularity"].toDouble(),
        id: json["id"],
        backdropPath: json["backdrop_path"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        firstAirDate: DateTime.parse(json["first_air_date"]),
        originCountry: List<OriginCountry>.from(json["origin_country"].map((x) => originCountryValues.map[x])),        
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        voteCount: json["vote_count"],
        name: json["name"],
        originalName: json["original_name"],
    );

    Map<String, dynamic> toMap() => {
        "poster_path": posterPath,
        "popularity": popularity,
        "id": id,
        "backdrop_path": backdropPath,
        "vote_average": voteAverage,
        "overview": overview,
        "first_air_date": "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "origin_country": List<dynamic>.from(originCountry.map((x) => originCountryValues.reverse[x])),        
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "vote_count": voteCount,
        "name": name,
        "original_name": originalName,
    };
}

enum OriginCountry { US, GB, JP }

final originCountryValues = EnumValues({
    "GB": OriginCountry.GB,
    "JP": OriginCountry.JP,
    "US": OriginCountry.US
});

enum OriginalLanguage { EN, JA }

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "ja": OriginalLanguage.JA
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

