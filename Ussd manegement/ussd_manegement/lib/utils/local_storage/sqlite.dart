import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ussd_manegement/features/app_screns_controllers/modals/streaModel.dart';

class DatabaseHelper {
  final databaseName = "stream.db";

  String streamTable =
      "CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, nipoDeRegisto TEXT NOT NULL, nomeDoCliente TEXT NOT NULL, numeroDoCliente INTEGER NOT NULL, numeroDoClienteDoPagamento INTEGER NOT NULL, emailDaConta TEXT NOT NULL, userDaConta TEXT NOT NULL, password TEXT NOT NULL, validade TEXT NOT NULL, dataDeSubscricao TEXT CURRENT_TIMESTAMP)";
  Future<Database> initDB() async {
    final DatabasesPath = await getDatabasesPath();
    final path = join(DatabasesPath, databaseName);
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(streamTable);
    });
  }

  // Cria Notas
  Future<int> createStream(ModelStream note) async {
    final Database db = await initDB();
    return db.insert("notes", note.toMap());
  }

  // pega notas
  Future<List<ModelStream>> getStream() async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query("notes");
    return result.map((e) => ModelStream.fromMap(e)).toList();
  }

  //  Deleta notes

  Future<int> delete(int id) async {
    final Database db = await initDB();
    return db.delete('notes', where: 'id  = ?', whereArgs: [id]);
  }

  Future<int> updateNote(tittle, content, id) async {
    final Database db = await initDB();
    return db.rawUpdate(
        'update notes set nipoDeRegisto = ?, nomeDoCliente = ?,  numeroDoClienteDoPagamento = ? numeroDoCliente , validade = ? , emailDaConta = ? , userDaConta = ? , password = ? , dataDeSubscricao = ? Where = ?',
        [tittle, content, id]);
  }
}
