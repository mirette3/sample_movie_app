

import 'package:sample_movies/data/data_source/base_datasource.dart';
import 'package:sample_movies/data/data_source/database_helper.dart';
import 'package:sample_movies/data/models/movie_model.dart';

class MovieLocalDataSource extends BaseDataSource{
  @override
  Future<List<MovieModel>> getPopularMovies() async{
    return DatabaseHelper.instance.retrieveMovies();

  }
}

