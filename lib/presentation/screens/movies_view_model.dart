import 'package:flutter/material.dart';
import 'package:sample_movies/data/data_source/local_data_source.dart';
import 'package:sample_movies/data/data_source/remote_data_source.dart';
import 'package:sample_movies/data/repo/movies_repo.dart';
import 'package:sample_movies/domain/base_repo/base_movie_repo.dart';
import 'package:sample_movies/domain/entities/movie_entity.dart';
import 'package:sample_movies/domain/usecase/popular_usecase.dart';

class MovieViewModel extends ChangeNotifier{

  List<MovieEntity> movies = [];
  // DatabaseHelper handler;


  void getPopularData() async {
    if(movies.isEmpty) {
      BaseRemoteDataSource baseRemoteDataSource = MovieRemoteDataSource();
      BaseMovieRepo baseMovieRepo = MoviesRepo(baseRemoteDataSource);
      final result = await PopularMoviesUseCase(baseMovieRepo).execute();
      result.fold((l) => null, (r) => movies = r);
      print("My moviesssssss$movies");
      notifyListeners();
      DatabaseHelper.instance.insertMovie(movies);
      notifyListeners();
    }else{
      DatabaseHelper.instance.retrieveMovies();
      notifyListeners();
    }
  }


  void initDb(){
    DatabaseHelper.instance.insertMovie(movies);
    // DatabaseHelper.initDatabase().whenComplete(() async {
    //   handler.insertMovie(movies);
    // notifyListeners();
    print("createddd");

    // });
  }

}