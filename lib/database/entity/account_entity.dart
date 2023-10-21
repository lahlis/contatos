// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:contatos/model/contato_model.dart';
import 'package:floor/floor.dart';

@Entity(tableName: "account")
class AccountEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final String phone;
  final String email;
  @ColumnInfo(name: "image_path")
  final String imagePath;
  
  AccountEntity({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.imagePath,
  });

  factory AccountEntity.fromModelToEntity(ContatoModel model) => AccountEntity(
        id: model.id,
        name: model.name ?? "",
        phone: model.phone ?? "",
        email: model.email ?? "",
        imagePath: model.imagePath ?? "",
      );
}
