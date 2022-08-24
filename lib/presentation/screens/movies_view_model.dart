import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sample_movies/data/data_source/base_datasource.dart';
import 'package:sample_movies/data/data_source/local_data_source.dart';
import 'package:sample_movies/data/data_source/remote_data_source.dart';
import 'package:sample_movies/data/repo/movies_repo.dart';
import 'package:sample_movies/domain/base_repo/base_movie_repo.dart';
import 'package:sample_movies/domain/entities/movie_entity.dart';
import 'package:sample_movies/domain/usecase/popular_usecase.dart';

class MovieViewModel extends ChangeNotifier{

  List<MovieEntity> movies = [];
  BaseDataSource? baseDataSource;

  void getPopularData() async {
    bool result = await InternetConnectionChecker().hasConnection;

    if(result== true) {
      baseDataSource = MovieRemoteDataSource();
      BaseMovieRepo baseMovieRepo = MoviesRepo(baseDataSource!);
      final result = await PopularMoviesUseCase(baseMovieRepo).execute();
      result.fold((l) => null, (r) => movies = r);
      print("from api");
      notifyListeners();

    }
    else{
      baseDataSource = MovieLocalDataSource();
      BaseMovieRepo baseMovieRepo = MoviesRepo(baseDataSource!);
      final result = await PopularMoviesUseCase(baseMovieRepo).execute();
      result.fold((l) => null, (r) => movies = r);
      print("from database");

      notifyListeners();
    }
  }



}