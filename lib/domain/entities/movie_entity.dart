const String tableMovies ='movies';
class MovieFields{
  static const String id='id';
  static const String title = 'title';
  static const String backdropPath='backdropPath';
  static const String overview='overview';
  static const String voteAverage='voteAverage';
  static const String releaseDate='releaseDate';
}

class MovieEntity {
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genderIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const MovieEntity( {
    required this.id,
     required this.title,
    required this.backdropPath,
    required  this.genderIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate
  });

  Map<String,Object?> convertDb()=>{
    MovieFields.id:id,
    MovieFields.title:title,
    MovieFields.backdropPath:backdropPath,
    MovieFields.overview:overview,
    MovieFields.voteAverage:voteAverage,
    MovieFields.releaseDate:releaseDate,

  };
}
