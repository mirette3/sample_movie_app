import 'package:dartz/dartz.dart';
import 'package:sample_movies/core/network/failuer.dart';
import 'package:sample_movies/domain/base_repo/base_movie_repo.dart';
import 'package:sample_movies/domain/entities/movie_entity.dart';

class PopularMoviesUseCase{
  //Inject of base movie repo 3shan m4 h3rf a5od mno object 3lshan abstract
  final BaseMovieRepo baseMovieRepo;

  PopularMoviesUseCase(this.baseMovieRepo);

  Future<Either<Failure,List<MovieEntity>>> execute() async{
    return await baseMovieRepo.getPopularMovies();
  }
}