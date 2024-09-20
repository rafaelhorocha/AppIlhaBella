// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_ilhabela/inicial.dart';

void main() {
  runApp(const IlhaBelaApp());
}

class IlhaBelaApp extends StatelessWidget {
  const IlhaBelaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IlhaBelaExperience(),
    );
  }
}

class IlhaBelaExperience extends StatelessWidget {
  const IlhaBelaExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double
            .infinity, // Faz com que o container azul ocupe toda a largura
        height:
            double.infinity, // Faz com que o container azul ocupe toda a altura
        decoration: const BoxDecoration(
          color: Color(0xFF608AC7), // cor de fundo azul
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder para a imagem do topo
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset(
                'assets/img/logo.png', // Verifique se o caminho está correto
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 0),
            // Texto "IlhaBela Experience" com sombra
            const Text(
              'IlhaBela\nExperience',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 249, 249),
                shadows: [
                  Shadow(
                    offset: Offset(6.0, 6.0), // Deslocamento da sombra
                    blurRadius: 2.0, // Raio de desfoque da sombra
                    color: Colors.black45, // Cor da sombra
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            // Botão "Entrar"
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InicioPag()),
                );
                // Ação do botão "Entrar"
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                backgroundColor: const Color.fromARGB(
                    255, 232, 246, 255), // Cor de fundo do botão
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(15), // Bordas arredondadas
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Entrar',
                    style: TextStyle(
                      color: Color(0xFF608AC7), // Cor do texto
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(width: 60),
                  Icon(
                    Icons.arrow_forward,
                    color: Color(0xFF608AC7),
                    size: 26,
                    // Cor do ícone
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
