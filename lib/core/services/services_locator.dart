
import 'package:get_it/get_it.dart';
import 'package:sample_movies/data/data_source/remote_data_source.dart';
import 'package:sample_movies/data/repo/movies_repo.dart';
import 'package:sample_movies/domain/base_repo/base_movie_repo.dart';
import 'package:sample_movies/domain/usecase/popular_usecase.dart';

final serviceLocator = GetIt.instance;
class ServicesLocator{
  void init(){
    
    //Create use case
    serviceLocator.registerLazySingleton(() => PopularMoviesUseCase(serviceLocator()));

    //Create object of repo
    serviceLocator.registerLazySingleton<BaseMovieRepo>(() => MoviesRepo(serviceLocator()));

    //Create object of Data Source
    serviceLocator.registerLazySingleton<BaseRemoteDataSource>(() => MovieRemoteDataSource());

  }
}