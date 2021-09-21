import 'dart:convert';

class MovieResult {
    MovieResult({
        this.posterPath,
        this.adult,
        this.overview,
        this.releaseDate,
        this.id,
        this.originalTitle,
        this.originalLanguage,
        this.title,
        this.backdropPath,
        this.popularity,
        this.voteCount,
        this.video,
        this.voteAverage,
    });

    final String posterPath;
    final bool adult;
    final String overview;
    final DateTime releaseDate;
    final int id;
    final String originalTitle;
    final OriginalLanguage originalLanguage;
    final String title;
    final String backdropPath;
    final double popularity;
    final int voteCount;
    final bool video;
    final double voteAverage;

    factory MovieResult.fromJson(String str) => MovieResult.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MovieResult.fromMap(Map<String, dynamic> json) => MovieResult(
        posterPath: json["poster_path"],
        adult: json["adult"],
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),        
        id: json["id"],
        originalTitle: json["original_title"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        title: json["title"],
        backdropPath: json["backdrop_path"],
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "poster_path": posterPath,
        "adult": adult,
        "overview": overview,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",        
        "id": id,
        "original_title": originalTitle,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "title": title,
        "backdrop_path": backdropPath,
        "popularity": popularity,
        "vote_count": voteCount,
        "video": video,
        "vote_average": voteAverage,
    };    
}

enum OriginalLanguage { EN }

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN
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
