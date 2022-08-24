import 'package:dartz/dartz.dart';
import 'package:sample_movies/core/network/failuer.dart';
import 'package:sample_movies/core/network/server_exption.dart';
import 'package:sample_movies/data/data_source/base_datasource.dart';
import 'package:sample_movies/domain/base_repo/base_movie_repo.dart';
import 'package:sample_movies/domain/entities/movie_entity.dart';

class MoviesRepo extends BaseMovieRepo {
  final BaseDataSource baseDataSource;

  MoviesRepo(this.baseDataSource);

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    final result = await baseDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
