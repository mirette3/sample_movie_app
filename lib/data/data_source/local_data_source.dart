import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sample_movies/data/models/database_movie_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDataSource {
  //This is the actual database filename that is saved in the docs directory.
  static const _databaseName = "MyMoviesDataBase.db";

  // Increment this version when you need to change the schema.
  static const _databaseVersion = 2;

  //Constructor
  LocalDataSource();

  // Make this a singleton class.
  LocalDataSource._privateConstructor();

  static final LocalDataSource instance = LocalDataSource._privateConstructor();

  // Only allow a single open connection to the database.
  static Database? _database;

  //to open Database{open connection}
  Future<Database> get database async {
    //if we have one open it
    if (_database != null) return _database!;
    //if we don't have..create one
    _database = await initDatabase();
    return _database!;
  }

  // open the database
  initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //store my database in this file path
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // Future close() async{
  //   final dp = await instance.database;
  //   dp.close();
  // }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
    
             CREATE TABLE myMovies (
                ${DataBaseMovieModel.fieldId} INTEGER NOT NULL,
                ${DataBaseMovieModel.fieldTitle} TEXT NOT NULL,
                ${DataBaseMovieModel.fieldBackdropPath} TEXT NOT NULL

              );
               ''');
  }

  // Database helper methods:
  Future<void> insertAllMovies(List<DataBaseMovieModel> movies) async {
    final Database db = await instance.initDatabase();
    for (var movie in movies) {
      await db.insert("myMovies", movie.toMap());
    }
  }

  Future<List<DataBaseMovieModel>> selectAllMovies() async {
    final Database db = await instance.initDatabase();
    final List<Map<String, dynamic>> maps = await db.query("myMovies");
    List<DataBaseMovieModel> o =
        List.generate(maps.length, (i) => DataBaseMovieModel.fromMap(maps[i]));

    return o;
  }
}
