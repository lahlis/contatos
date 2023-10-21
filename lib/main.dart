import 'package:contatos/database/app_database.dart';
import 'package:contatos/pages/home.dart';
import 'package:contatos/repository/account_repository.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database =
      await $FloorAppDatabase.databaseBuilder("account_database.db").build();

  final AccountRepository repository = AccountRepository(
    accountDao: database.accountDao,
  );

  runApp(
    MyApp(repository: repository),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.repository,
  });

  final AccountRepository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: Home(
        repository: repository,
      ),
    );
  }
}
