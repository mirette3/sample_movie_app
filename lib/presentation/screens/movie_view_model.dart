import 'package:flutter/material.dart';
import 'package:sample_movies/data/data_source/local_data_source.dart';
import 'package:sample_movies/data/data_source/remote_data_source.dart';
import 'package:sample_movies/data/mapper.dart';
import 'package:sample_movies/data/repo/movies_repo.dart';
import 'package:sample_movies/domain/base_repo/base_movie_repo.dart';
import 'package:sample_movies/domain/entities/movie_entity.dart';

import '../../domain/usecase/popular_usecase.dart';

class MovieViewModel extends ChangeNotifier {
  List<MovieEntity> movies = [];

  init() async {
    BaseMovieRepo baseMovieRepo = MovieRepository(
        movieRemoteDataSource: MovieRemoteDataSource(),
        mapper: Mapper(),
        movieLocalDataSource: LocalDataSource());

    final result = await PopularMoviesUseCase(baseMovieRepo).execute();
    movies = result;
    notifyListeners();
  }
}
