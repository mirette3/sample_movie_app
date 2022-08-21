import 'package:dartz/dartz.dart';
import 'package:sample_movies/core/network/failuer.dart';
import 'package:sample_movies/domain/entities/movie_entity.dart';

abstract class BaseMovieRepo{
  Future<Either<Failure,List<MovieEntity>>> getPopularMovies();
}