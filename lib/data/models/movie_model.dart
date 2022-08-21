import 'package:sample_movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genderIds,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      genderIds: List<int>.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date']);

  Map<String, dynamic> toJson() => {
        "id": id,
        'title': title,
        'backdrop_path': backdropPath,
        'genre_ids': genderIds,
        'overview': overview,
        'vote_average': voteAverage,
        'release_date': releaseDate,
      };

  @override
  String toString() => toJson().toString();
}
