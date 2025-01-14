import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
      CREATE TABLE employee(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      email TEXT
      )
    """);
  }

  // call db
  static Future<sql.Database> db() async {
    return sql.openDatabase('employee.db', version: 1,
      onCreate: (sql.Database database, int version) async {
    await createTables(database);
    });
  }

  // insert Employee
  static Future<int> addEmployee(String name, String email) async {
    final db = await SQLHelper.db();
    final data = {'name' : name, 'email': email};
    return await db.insert('employee', data);
  }

  // read Employee
  static Future<List<Map<String, dynamic>>> getEmployee() async {
    final db = await SQLHelper.db();
    return db.query('employee');
  }

  // search Employee by name
  static Future<List<Map<String, dynamic>>> searchEmployeeByName(String query) async {
    final db = await SQLHelper.db();
    return db.query(
      'employee',
      where: "name LIKE ?",
      whereArgs: ['%$query%'],
    );
  }

  // update Employee
  static Future<int> editEmployee(int id, String name, String email) async {
    final db = await SQLHelper.db();
    final data = {'name': name, 'email': email};
    return await db.update('employee', data, where: "id = $id");
  }

  // delete Employee
  static Future<int> deleteEmployee(int id) async {
    final db = await SQLHelper.db();
    return await db.delete('employee', where: "id = $id");
  }
}