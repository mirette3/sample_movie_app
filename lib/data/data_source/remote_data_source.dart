import 'package:dio/dio.dart';
import 'package:sample_movies/core/network/error_model.dart';
import 'package:sample_movies/core/network/server_exption.dart';
import 'package:sample_movies/core/utiles/app_constants.dart';
import 'package:sample_movies/data/data_source/base_datasource.dart';
import 'package:sample_movies/data/data_source/database_helper.dart';
import 'package:sample_movies/data/models/movie_model.dart';

class MovieRemoteDataSource extends BaseDataSource {

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response= await Dio().get(AppConstants.popularPath);
    if(response.statusCode==200){
      List<MovieModel> re = List<MovieModel>.from((response.data['results']as List ).map(
            (e) => MovieModel.fromJson(e),
      ));
      for(int i = 0 ; i< re.length;i++) {
        var result = DatabaseHelper.instance.insertMovie(re[i]);
        print("Saved Successfully $result");
      }
      return re;
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }

}