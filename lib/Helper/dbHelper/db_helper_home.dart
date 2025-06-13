import 'package:flutter_task_13/Helper/modelUser/model_cart.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'cart.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE cart(id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT,kategori TEXT,harga INTEGER)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertCart(Cart cart) async {
    final db = await DatabaseHelper.db();
    await db.insert(
      'cart',
      cart.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Cart>> getAllCart() async {
    final db = await DatabaseHelper.db();
    final List<Map<String, dynamic>> maps = await db.query('cart');

    return List.generate(maps.length, (i) => Cart.fromMap(maps[i]));
  }

  static Future<void> deleteCart(int id) async {
    final db = await DatabaseHelper.db();
    await db.delete('cart', where: 'id = ?', whereArgs: [id]);

    final count = Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT (*) FROM cart'),
    );
    if (count == 0) {
      await db.execute("DELETE FROM sqlite_sequence WHERE name ='cart'");
    }
  }

  static Future<void> updateCart(Cart cart) async {
    final db = await DatabaseHelper.db();
    await db.update(
      'cart',
      cart.toMap(),
      where: 'id = ?',
      whereArgs: [cart.id],
    );
  }
}
