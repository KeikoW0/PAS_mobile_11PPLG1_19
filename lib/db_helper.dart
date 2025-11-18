import 'package:pas_mobile_11pplg1_19/models/products_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('products.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE categories (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      price TEXT,
      description TEXT,
      rating TEXT
    )
    ''');
  }

  Future<int> create(ProductsModel category) async {
    final db = await instance.database;
    return await db.insert('categories', category.toJson());
  }

  Future<List<ProductsModel>> readAllCategories() async {
    final db = await instance.database;
    final result = await db.query('categories');
    return result.map((json) => ProductsModel.fromJson(json)).toList();
  }

  Future<int> update(ProductsModel category) async {
    final db = await instance.database;
    return await db.update(
      'categories',
      category.toJson(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete('categories', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> insertBatch(List<ProductsModel> categories) async {
    final db = await instance.database;
    Batch batch = db.batch();
    for (var cat in categories) {
      batch.insert('categories', cat.toJson());
    }
    await batch.commit(noResult: true);
  }
}
