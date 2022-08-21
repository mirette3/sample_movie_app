import 'package:dio/dio.dart';
import 'package:sample_movies/core/network/error_model.dart';
import 'package:sample_movies/core/network/server_exption.dart';
import 'package:sample_movies/core/utiles/app_constants.dart';
import 'package:sample_movies/data/models/movie_model.dart';


abstract class BaseRemoteDataSource{
  Future<List<MovieModel>> getPopularMovies();
}

class MovieRemoteDataSource extends BaseRemoteDataSource {

   @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response= await Dio().get(AppConstants.popularPath);
    if(response.statusCode==200){
      dynamic re = List<MovieModel>.from((response.data['results']as List ).map(
            (e) => MovieModel.fromJson(e),
      ));
      print(re);
      return re;
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
     
   }
}