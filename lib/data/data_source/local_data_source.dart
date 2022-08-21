import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sample_movies/data/models/movie_model.dart';
import 'package:sample_movies/domain/entities/movie_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  //This is the actual database filename that is saved in the docs directory.
  static const _databaseName = "MyMovies.db";
  // Increment this version when you need to change the schema.
  static const _databaseVersion = 2;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

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
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future close() async{
    final dp = await instance.database;
    dp.close();
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
             CREATE TABLE $tableMovies (
                ${MovieFields.id} INTEGER PRIMARY KEY UNIQUE,
                ${MovieFields.title} TEXT NOT NULL,
                ${MovieFields.backdropPath} TEXT NOT NULL,
                ${MovieFields.overview} TEXT NOT NULL,
                ${MovieFields.voteAverage} DOUBLE NOT NULL,
                ${MovieFields.releaseDate} TEXT NOT NULL 
                
              )
               ''');
  }

  // Database helper methods:
  Future<int> insertMovie(List<MovieEntity> movies) async {
    int result = 0;
    final Database db = await initDatabase();
    for(var movie in movies){
      result = await db.insert(tableMovies, movie.convertDb());
    }
    //result = await db.insert(tableMovies, movies.toJson());
    return result;
  }

  Future<List<MovieModel>> retrieveMovies() async {
    final Database db = await initDatabase();
    final List<Map<String, Object?>> queryResult = await db.query(tableMovies);
    return queryResult.map((e) => MovieModel.fromJson(e)).toList();
  }

}