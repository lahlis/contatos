import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:contatos/database/dao/account_dao.dart';
import 'package:contatos/database/entity/account_entity.dart';
import 'package:floor/floor.dart';

part 'app_database.g.dart';

@Database(
  version: 1,
  entities: [
    AccountEntity,
  ],
)
abstract class AppDatabase extends FloorDatabase {
  AccountDao get accountDao;
}
