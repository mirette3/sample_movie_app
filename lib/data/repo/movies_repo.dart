import 'package:sample_movies/domain/base_repo/base_movie_repo.dart';
import 'package:sample_movies/domain/entities/movie_entity.dart';

class MovieRepository extends BaseMovieRepo{
  MovieRepository({required super.movieRemoteDataSource, required super.mapper, required super.movieLocalDataSource});


  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    // First, try to fetch the movies from database
    final dbEntities = await movieLocalDataSource.selectAllMovies();

    if (dbEntities.isNotEmpty) {
      print("from database");
      return mapper.toListOfMovieEntityFromDb(dbEntities);
    }

    // If the database is empty, fetch from the API, saved it to database,
    // and return it to the caller
    final response = await movieRemoteDataSource.getApiPopularMovies();
    final movies = mapper.toListOfMovieEntity(response);
    await movieLocalDataSource.insertAllMovies(mapper.toListMoviesDbEntity(movies));
    print("from api");

    return movies;
  }
}
