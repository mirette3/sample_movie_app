import 'package:sample_movies/domain/entities/movie_entity.dart';

class ApiMovieModel extends MovieEntity {

  ApiMovieModel(
      {required super.id,
        required super.title,
        required super.backdropPath,
      });
  factory ApiMovieModel.fromJson(Map<String, dynamic> json) => ApiMovieModel(
    id: json['id'],
    title: json['title'],
    backdropPath: json['backdrop_path'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    'title': title,
    'backdrop_path': backdropPath,
  };

  @override
  String toString() => toJson().toString();


}
