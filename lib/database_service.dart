import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'movie.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'flutter_database.db');

    return await openDatabase(
      path,
      onCreate: _onCreate,
      onOpen: (db) async {
        await db.execute('DROP TABLE IF EXISTS movies');
        await _onCreate(db, 1);
      },
      version: 1,
    );
  } //drops the Table to make sure no duplicate data is stored

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE IF NOT EXISTS movies (id INTEGER PRIMARY KEY, title TEXT, year TEXT, rated TEXT, released TEXT, runtime TEXT, genre TEXT, director TEXT, writer TEXT, actors TEXT, plot TEXT, language TEXT, country TEXT, awards TEXT, poster TEXT, metascore TEXT, imdbRating TEXT, imdbVotes TEXT, imdbID TEXT, type TEXT, images TEXT)',
    );
  }

  Future<List<Movie>> getMovies() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('movies');
    return List.generate(maps.length, (index) => Movie.fromMap(maps[index]));
  }

  Future<List<Movie>> findByTitle(String name) async {
    final db = await database;
    final q = '$name%';
    final List<Map<String, dynamic>> maps = await db.query(
      'movies',
      where: 'Title like ?',
      whereArgs: [q],
    );
    return List.generate(maps.length, (index) => Movie.fromMap(maps[index]));
  }

  Future<void> insertMovie(Movie movie) async {
    final db = await database;
    await db.insert(
      'movies',
      movie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
