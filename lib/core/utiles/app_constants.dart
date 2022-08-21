class AppConstants{
  static const baseUrl ="https://api.themoviedb.org/3";
  static const apiKey ="4586ea8dac4b1b86b4936370c06000d4";
  static const String popularPath ="$baseUrl/movie/popular?api_key=$apiKey";
  static const baseImageUrl='https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path )=>'$baseImageUrl$path';

}