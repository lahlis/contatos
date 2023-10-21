import 'dart:io';

import 'package:contatos/repository/account_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({
    super.key,
    required this.repository,
  });

  final AccountRepository repository;

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar contato"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                showCupertinoModalPopup<void>(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    actions: [
                      CupertinoActionSheetAction(
                        onPressed: () {
                          widget.repository
                              .handleImagePicker(ImageSource.camera)
                              .then((value) {
                            Navigator.pop(context);
                            setState(() {});
                          });
                        },
                        child: const Text("Camera"),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () {
                          widget.repository
                              .handleImagePicker(ImageSource.gallery)
                              .then((value) {
                            Navigator.pop(context);
                            setState(() {});
                          });
                        },
                        child: const Text("Galeria"),
                      ),
                    ],
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                  ),
                  width: 120,
                  height: 120,
                  child: widget.repository.image.isNotEmpty
                      ? Image.file(
                          File(widget.repository.image),
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.person,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: widget.repository.nameTextEditingController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: "Informe o nome"),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: widget.repository.emailTextEditingController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: "Informe o email"),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: widget.repository.phoneTextEditingController,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(hintText: "Informe o telefone"),
            ),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              widget.repository.createAccount().then((value) {
                widget.repository.clearRepository();
                Navigator.pop(context);
              });
            },
            child: const Text("Criar"),
          ),
        ),
      ),
    );
  }
}
