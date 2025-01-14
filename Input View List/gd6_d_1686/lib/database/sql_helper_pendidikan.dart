import 'package:sqflite/sqflite.dart' as sql;

class SqlHelperPendidikan {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
      CREATE TABLE pendidikan(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      nameSekolah TEXT,
      jenjang TEXT,
      jurusan TEXT
      )
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('pendidikan.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> addPendidikan(
      String nameSekolah, String jenjang, String jurusan) async {
    final db = await SqlHelperPendidikan.db();
    final data = {
      'nameSekolah': nameSekolah,
      'jenjang': jenjang,
      'jurusan': jurusan
    };
    return await db.insert('pendidikan', data);
  }

  // read Pendidikan
  static Future<List<Map<String, dynamic>>> getPendidikan() async {
    final db = await SqlHelperPendidikan.db();
    return db.query('pendidikan');
  }

  // search Pendidikan by nameSekolah
  static Future<List<Map<String, dynamic>>> searchPendidikanByNameSekolah(
      String query) async {
    final db = await SqlHelperPendidikan.db();
    return db.query(
      'pendidikan',
      where: "nameSekolah LIKE ?",
      whereArgs: ['%$query%'],
    );
  }

  // update Pendidikan
  static Future<int> editPendidikan(
      int id, String nameSekolah, String jenjang, String jurusan) async {
    final db = await SqlHelperPendidikan.db();
    final data = {
      'nameSekolah': nameSekolah,
      'jenjang': jenjang,
      'jurusan': jurusan
    };
    return await db.update('pendidikan', data, where: "id = $id");
  }

  // delete pendidikan
  static Future<int> deletePendidikan(int id) async {
    final db = await SqlHelperPendidikan.db();
    return await db.delete('pendidikan', where: "id = $id");
  }
}
