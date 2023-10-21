
import 'package:contatos/database/entity/account_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class AccountDao {
  
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAccount(AccountEntity entity);

  @Query("""
    SELECT *
    FROM account
  """)
  Future<List<AccountEntity>> fetchAllAccount();

  @Query("""
    DELETE
    FROM account
    WHERE id = :id
  """)
  Future<void> deleteAccount(int id);
}