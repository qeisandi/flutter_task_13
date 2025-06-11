import 'package:flutter_task_13/project/modelUser/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      version: 1,
      join(dbPath, 'andippkd_mpro_b2'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,username TEXT,email TEXT,phone TEXT,password TEXT)',
        );
      },
    );
  }

  static Future<void> registerUser({UserModel? data}) async {
    final db = await initDB();

    await db.insert('users', {
      'email': data?.email,
      'name': data?.name,
      'username': data?.username,
      'password': data?.password,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
    print("User registered successfully");
  }

  static Future<UserModel?> login(String email, String password) async {
    final db = await initDB();
    final List<Map<String, dynamic>> data = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (data.isNotEmpty) {
      return UserModel.fromMap(data.first);
    } else {
      return null;
    }
  }

  static getEditCartItems() {}
}
