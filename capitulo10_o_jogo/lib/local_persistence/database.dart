import 'dart:io';

import 'package:capitulo10ojogo/local_persistence/lp_constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SQFLiteDataBase {
  /// Objeto SQFLite para nossa base de dados
  static Database _database;

  /// Um construtor privado, atuando como um singleton para termos sempre a mesma
  /// conexão em toda a aplicação
  SQFLiteDataBase._privateConstructor();
  static final SQFLiteDataBase instance = SQFLiteDataBase._privateConstructor();

  /// Acessor à base de dados
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  /// Método que inicializará a base de dados, caso ainda não exista
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, kDatabaseName);
    return await openDatabase(path,
        version: kDatabaseVersion,
        onCreate: _onCreateDb,
        onUpgrade: _nUpgradeDb,
        onDowngrade: _onDowngradeDb);
  }

  /// Métodos que serão executados de acordo ao estado identificado na
  /// inicialização.
  Future _onCreateDb(Database database, int version) async {
    await database.execute("CREATE TABLE tb_palavras ("
        "palavraID TEXT PRIMARY KEY,"
        "palavra TEXT,"
        "ajuda TEXT"
        ")");
  }

  Future _nUpgradeDb(
      Database database, int previousVersion, int newVersion) async {
//    print('newVersion -> $newVersion');
//    if (newVersion == 2) {
//      _upgradeToVersion2(database, previousVersion, newVersion);
//    } else if (newVersion == 3) {
//      _upgradeToVersion3(database, previousVersion, newVersion);
////    } else if (newVersion == 4) {
////      _upgradeToVersion4(database, previousVersion, newVersion);
//    }
  }

//  _upgradeToVersion2(
//      Database database, int previousVersion, int newVersion) async {
//    await database.execute("CREATE TABLE tb_palavras ("
//        "disciplinaID TEXT PRIMARY KEY,"
//        "palavra TEXT,"
//        "ajuda TEXT"
//        ")");
//    await database.execute("DROP TABLE disciplinas");
//  }
//
//  _upgradeToVersion3(
//      Database database, int previousVersion, int newVersion) async {
//    if (previousVersion == 1)
//      _upgradeToVersion2(database, previousVersion, newVersion);
//
//    await database.execute("DROP TABLE tb_palavras");
//    await database.execute("CREATE TABLE tb_palavras ("
//        "palavraID TEXT PRIMARY KEY,"
//        "palavra TEXT,"
//        "ajuda TEXT"
//        ")");
//  }

//  _upgradeToVersion4(
//      Database database, int previousVersion, int newVersion) async {
//    if (previousVersion >= 3)
//      _upgradeToVersion2(database, previousVersion, newVersion);
//
//    await database.execute("DROP TABLE tb_palavras");
//    await database.execute("CREATE TABLE tb_palavras ("
//        "palavraID TEXT PRIMARY KEY,"
//        "palavra TEXT,"
//        "ajuda TEXT"
//        ")");
//  }

  Future _onDowngradeDb(
      Database database, int previousVersion, int newVersion) async {}
}
