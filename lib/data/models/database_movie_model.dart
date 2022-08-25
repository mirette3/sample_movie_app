class DataBaseMovieModel{
  static const fieldId = 'id';
  static const fieldTitle = 'title';
  static const fieldBackdropPath = 'backdrop_path';

  final int id;
  final String title;
  final String backdropPath;

  const DataBaseMovieModel({
    required this.id,
    required this.title,
    required this.backdropPath,
  });

  DataBaseMovieModel.fromMap(Map<String, dynamic> map)
      : id = map[fieldId] as int,
        title = map[fieldTitle] as String,
        backdropPath = map[fieldBackdropPath] as String;

  Map<String, dynamic> toMap() => {
    fieldId: id,
    fieldTitle: title,
    fieldBackdropPath: backdropPath,
  };

}