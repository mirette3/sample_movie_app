
import 'package:sample_movies/data/models/database_movie_model.dart';
import 'package:sample_movies/data/models/api_movie_model.dart';
import 'package:sample_movies/domain/entities/movie_entity.dart';

class MapperException<From, To> implements Exception {
  final String message;

  const MapperException(this.message);

  @override
  String toString() {
    return 'Error when mapping class $From to $To: $message}';
  }
}

//This class to convert model of one data layer to another data layer.

class Mapper {
  MovieEntity toMovieEntity(ApiMovieModel entity) {
    try {
      return MovieEntity(
        id: entity.id,
        title: entity.title,
        backdropPath: entity.backdropPath,
      );
    } catch (e) {
      throw MapperException<ApiMovieModel, MovieEntity>(e.toString());
    }
  }

  List<MovieEntity> toListOfMovieEntity(List<ApiMovieModel> entities) {
    final List<MovieEntity> recipes = [];

    for (final entity in entities) {
      recipes.add(toMovieEntity(entity));
    }

    return recipes;
  }

  MovieEntity toMovieEntityFromDb(DataBaseMovieModel entity) {
    try {
      return MovieEntity(
        id: entity.id,
        title: entity.title,
        backdropPath: entity.backdropPath,
      );
    } catch (e) {
      throw MapperException<DataBaseMovieModel, MovieEntity>(e.toString());
    }
  }

  List<MovieEntity> toListOfMovieEntityFromDb(List<DataBaseMovieModel> entities) {
    final List<MovieEntity> recipes = [];

    for (final entity in entities) {
      recipes.add(toMovieEntityFromDb(entity));
    }

    return recipes;
  }

  DataBaseMovieModel toMovieDbEntity(MovieEntity recipe) {
    try {
      return DataBaseMovieModel(
        id: recipe.id,
        title: recipe.title,
        backdropPath: recipe.backdropPath,
      );
    } catch (e) {
      throw MapperException<MovieEntity, DataBaseMovieModel>(e.toString());
    }
  }

  List<DataBaseMovieModel> toListMoviesDbEntity(List<MovieEntity> entities) {
    final List<DataBaseMovieModel> list = [];

    for (final entity in entities) {
      list.add(toMovieDbEntity(entity));
    }

    return list;
  }
}
