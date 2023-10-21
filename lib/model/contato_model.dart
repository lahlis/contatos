// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:contatos/database/entity/account_entity.dart';

class ContatoModel {
  final int? id;
  final String? name;
  final String? imagePath;
  final String? phone;
  final String? email;

  ContatoModel({
    this.id,
    this.name,
    this.imagePath,
    this.phone,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'phone': phone,
      'email': email,
    };
  }

  factory ContatoModel.fromMap(Map<String, dynamic> map) {
    return ContatoModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      imagePath: map['imagePath'] != null ? map['imagePath'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContatoModel.fromJson(String source) =>
      ContatoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ContatoModel(id: $id, name: $name, imagePath: $imagePath, phone: $phone, email: $email)';
  }

  factory ContatoModel.fromEntityToModel(AccountEntity entity) => ContatoModel(
        id: entity.id,
        name: entity.name,
        phone: entity.phone,
        email: entity.email,
        imagePath: entity.imagePath,
      );
}
