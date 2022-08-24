import 'package:sample_movies/data/models/movie_model.dart';

abstract class BaseDataSource{
  Future<List<MovieModel>> getPopularMovies();
}