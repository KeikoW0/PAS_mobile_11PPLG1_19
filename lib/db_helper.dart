import 'package:pas_mobile_11pplg1_19/models/products_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("products.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY,
        title TEXT,
        price REAL,
        description TEXT,
        category TEXT,
        image TEXT,
        rate REAL,
        count INTEGER
      )
    ''');
  }

  // * Convert Model -> Map (SQLite schema)
  Map<String, dynamic> _toDbJson(ProductsModel p) => {
    "id": p.id,
    "title": p.title,
    "price": p.price,
    "description": p.description,
    "category": categoryValues.reverse[p.category],
    "image": p.image,
    "rate": p.rating.rate,
    "count": p.rating.count,
  };

  ProductsModel _fromDbJson(Map<String, dynamic> json) => ProductsModel(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    category: categoryValues.map[json["category"]]!,
    image: json["image"],
    rating: Rating(rate: json["rate"], count: json["count"]),
  );

  // INSERT
  Future<void> insertBatch(List<ProductsModel> list) async {
    final db = await instance.database;
    Batch batch = db.batch();

    for (var p in list) {
      batch.insert("products", _toDbJson(p));
    }
    await batch.commit(noResult: true);
  }

  // READ
  Future<List<ProductsModel>> readAll() async {
    final db = await instance.database;
    final data = await db.query("products");

    return data.map((e) => _fromDbJson(e)).toList();
  }
}
