import 'package:sample_movies/data/data_source/local_data_source.dart';
import 'package:sample_movies/data/data_source/remote_data_source.dart';
import 'package:sample_movies/data/mapper.dart';
import 'package:sample_movies/domain/entities/movie_entity.dart';

abstract class BaseMovieRepo {
  final MovieRemoteDataSource movieRemoteDataSource;
  final Mapper mapper;
  final LocalDataSource movieLocalDataSource;

  BaseMovieRepo({
    required this.movieRemoteDataSource,
    required this.mapper,
    required this.movieLocalDataSource,
  });

  Future<List<MovieEntity>> getPopularMovies();
}
