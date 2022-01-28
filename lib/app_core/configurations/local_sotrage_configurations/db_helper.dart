import 'package:flutter/foundation.dart';
import 'package:pokemon_app/home/models/pokemon_detail_model.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DBHelper with ChangeNotifier {
  static const tableName = 'favorite_table';
  late sql.Database db;

  DBHelper() {
    init();
  }

  void init() async {
    final dbPath = await sql.getDatabasesPath();
    db = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        final stmt = '''CREATE TABLE IF NOT EXISTS $tableName (
            id TEXT PRIMARY KEY,
            name TEXT,
            image TEXT
        )'''
            .trim()
            .replaceAll(RegExp(r'[\s]{2,}'), ' ');
        return db.execute(stmt);
      },
      version: 1,
    );
    notifyListeners();
  }

  Future<int> insert(Map<String, Object> data) async {
    return await db.insert(tableName, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  Future<List<PokemonFavoriteModel>> getData() async {
    List<PokemonFavoriteModel> data = [];
    return await db.query(tableName).then((value) {
      for (var element in value) {
      data.add(PokemonFavoriteModel.fromJson(element));
      }
      return data;
    });
  }

  Future<int> removeFavorite(String id) async {
    int count =
        await db.rawDelete('DELETE FROM favorite_table WHERE id = ?', [id]);
    assert(count == 1);
    return count;
  }

  Future<bool> isFavorite(String id) async {
    var dbclient = await db;
    int? count = Sqflite.firstIntValue(await dbclient
        .rawQuery("SELECT COUNT(*) FROM $tableName WHERE id=$id"));
    print(count);
    return count == 0 ? false : true;
  }
}
