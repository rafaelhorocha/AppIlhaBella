// description.dart
// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'comoChegar.dart'; // Importando a classe ComoChegar
import 'praia.dart'; // Importando a classe Praia

class DescriptionPage extends StatelessWidget {
  final Praia praia;

  const DescriptionPage({
    super.key,
    required this.praia,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(praia.nome),
      ),
      body: Container(
        color: const Color.fromRGBO(86, 133, 177, 1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(praia.imagem, fit: BoxFit.cover),
              const SizedBox(height: 16),
              Text(
                praia.descricao,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                'Como chegar:',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              // Adicione aqui a descrição de como chegar, se necessário
              const Text(
                'Informações de como chegar podem ser adicionadas aqui.',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
