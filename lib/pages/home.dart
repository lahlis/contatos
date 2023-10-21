import 'dart:io';

import 'package:contatos/model/contato_model.dart';
import 'package:contatos/pages/create_account.dart';
import 'package:contatos/repository/account_repository.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.repository,
  });
  final AccountRepository repository;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos"),
      ),
      body: Column(
        children: [
          FutureBuilder<List<ContatoModel>>(
            future: widget.repository.fetchAllAccount(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.data != null &&
                  snapshot.data!.isNotEmpty) {
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      widget.repository.fetchAllAccount().then((value) {
                        setState(() {});
                      });
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final ContatoModel element = snapshot.data![index];
                        return SizedBox(
                          width: double.infinity,
                          child: Card(
                            child: Row(children: [
                              (element.imagePath != null &&
                                      element.imagePath!.isNotEmpty)
                                  ? Image.file(
                                      File(element.imagePath!),
                                      width: 48,
                                      height: 48,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      "assets/images/cat.jpg",
                                      width: 48,
                                      height: 48,
                                    ),
                              const SizedBox(width: 8),
                              Text(element.name ?? ""),
                            ]),
                          ),
                        );
                      },
                      itemCount: snapshot.data!.length,
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Text("Sem contatos no momento!"),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateAccount(
                repository: widget.repository,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
