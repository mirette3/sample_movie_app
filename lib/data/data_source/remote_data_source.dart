import 'package:dio/dio.dart';
import 'package:sample_movies/core/network/error_model.dart';
import 'package:sample_movies/core/network/server_exption.dart';
import 'package:sample_movies/core/utiles/app_constants.dart';
import 'package:sample_movies/data/models/api_movie_model.dart';

class MovieRemoteDataSource {

  Future<List<ApiMovieModel>> getApiPopularMovies() async{
    final response= await Dio().get(AppConstants.popularPath);
    if(response.statusCode==200){
      List<ApiMovieModel> re = List<ApiMovieModel>.from((response.data['results']as List ).map(
            (e) => ApiMovieModel.fromJson(e),
      ));
      print("my api movies $re");
      return re;
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }

}