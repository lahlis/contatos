import 'package:contatos/database/dao/account_dao.dart';
import 'package:contatos/database/entity/account_entity.dart';
import 'package:contatos/model/contato_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AccountRepository {
  AccountRepository({
    required this.accountDao,
  });

  final AccountDao accountDao;

  String _imagePath = "";

  final TextEditingController nameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
      TextEditingController();

  String get image => _imagePath;

  Future<void> createAccount() async {
    final ContatoModel contatoModel = ContatoModel(
      imagePath: image,
      name: nameTextEditingController.text,
      email: emailTextEditingController.text,
      phone: phoneTextEditingController.text,
    );

    await accountDao.insertAccount(
      AccountEntity.fromModelToEntity(contatoModel),
    );
  }

  Future<List<ContatoModel>> fetchAllAccount() async {
    final List<AccountEntity> result = await accountDao.fetchAllAccount();
    return result.map((e) => ContatoModel.fromEntityToModel(e)).toList();
  }

  Future<void> handleImagePicker(ImageSource source) async {
    final XFile? result = await ImagePicker().pickImage(
      source: source,
      imageQuality: 80,
      maxWidth: 1920,
      maxHeight: 1080,
    );

    _imagePath = result?.path ?? "";
  }

  void clearRepository() {
    _imagePath = "";
    nameTextEditingController.clear();
    emailTextEditingController.clear();
    phoneTextEditingController.clear();
  }
}
