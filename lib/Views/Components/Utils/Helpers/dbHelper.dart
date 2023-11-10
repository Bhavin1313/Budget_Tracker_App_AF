import 'package:budget_tracker_app/Model/categorymodel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB_Helper {
  DB_Helper._();

  static final DB_Helper db_helper = DB_Helper._();

  static Database? database;
  static String category_table = "category";
  static String category_id = "cat_id";
  static String category_name = "category_name";
  static String category_image = "category_image";

  initDB() async {
    String db_Path = join(await getDatabasesPath(), 'rwn.db');

    database = await openDatabase(db_Path, version: 1,
        onCreate: (Database db, _) async {
      String query =
          "CREATE TABLE IF NOT EXISTS $category_table($category_id INTEGER PRIMARY KEY AUTOINCREMENT,$category_name TEXT NOT NULL,$category_image BLOB);";
      await db.execute(query);
    });
  }

  Future<int?> insertCategory({required Category cat_data}) async {
    await initDB();
    String query =
        "INSERT INTO $category_table($category_name,$category_image) VALUES(?,?)";
    List args = [cat_data.category_name, cat_data.category_image];
    int? res = await database?.rawInsert(query, args);
    return res;
  }

  Future<List<Category>> fetchCategoryData() async {
    await initDB();
    String query = "SELECT * FROM $category_table;";
    List<Map<String, dynamic>> fetchedData = await database!.rawQuery(query);
    List<Category> fetchedCategory =
        fetchedData.map((e) => Category.fromSQL(data: e)).toList();
    return fetchedCategory;
  }

  Future<int?> deleteCategory({required int id}) async {
    await initDB();
    String query = "DELETE FROM $category_table WHERE $category_id=$id;";
    int? res = await database?.rawDelete(query);
    return res;
  }

  Future<int?> updateCategory({required Category data, required int id}) async {
    await initDB();
    String query =
        "UPDATE $category_table SET $category_name=?,$category_image=? WHERE $category_id=$id;";
    List args = [data.category_name, data.category_image];
    int? res = await database?.rawUpdate(query, args);
    return res;
  }

  Future<List<Category>?> searchCategoryData(
      {required String searchName}) async {
    await initDB();
    String query =
        "SELECT * FROM $category_table WHERE $category_name LIKE '%$searchName%';";
    List<Map<String, dynamic>> fetchedData =
        (await database!.rawDelete(query)) as List<Map<String, dynamic>>;
    List<Category> searchedCategory =
        fetchedData.map((e) => Category.fromSQL(data: e)).toList();
    return searchedCategory;
  }
}
