// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_ilhabela/avalia%C3%A7%C3%A3oPag.dart';
import 'package:flutter_application_ilhabela/eventosPag.dart';
import 'package:flutter_application_ilhabela/main.dart';
import 'package:flutter_application_ilhabela/mapa.dart';
import 'package:flutter_application_ilhabela/praia.dart';

import 'ComoChegar.dart';

// Modelo de Praia

// Função para obter a lista de praias

void main() {
  runApp(const InicioPag());
}

class InicioPag extends StatelessWidget {
  const InicioPag({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppIlhaBela',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var praias = getPraias(); // Obtém a lista de praias

    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(86, 133, 177, 1), // Background da tela
        child: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(text: 'CONHEÇA MAIS SOBRE '),
                          TextSpan(
                            text: 'ILHABELA\n',
                            style: TextStyle(
                              color: Color.fromRGBO(5, 51, 94, 1),
                            ),
                          ),
                          TextSpan(text: ' E SUAS PRAIAS!'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Loop para exibir as praias
                  for (int index = 0; index < praias.length; index++)
                    Column(
                      children: [
                        StackButton(
                          text: praias[index].nome,
                          imagePath: praias[index].imagem,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DescriptionPage(index: index),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromRGBO(186, 222, 255, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Image.asset('assets/img/inicio.png'),
              iconSize: 60,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InicioPag()),
                );
              },
            ),
            IconButton(
              icon: Image.asset('assets/img/calendario.png'),
              iconSize: 60,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const EventPag()),
                );
              },
            ),
            IconButton(
              icon: Image.asset('assets/img/mapa.png'),
              iconSize: 60,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapaPag()),
                );
              },
            ),
            IconButton(
              icon: Image.asset('assets/img/like.png'),
              iconSize: 60,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const avaliacaoPag()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StackButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final VoidCallback onPressed;

  const StackButton({
    super.key,
    required this.text,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: const Color.fromRGBO(2, 118, 125, 1),
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(4, 4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Stack(
                children: [
                  Image.asset(
                    imagePath,
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: 300,
                    height: 200,
                    color: const Color.fromARGB(74, 122, 122, 122),
                  ),
                ],
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(3, 3),
                    blurRadius: 3,
                    color: Colors.black54,
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

// Página de descrição
class DescriptionPage extends StatelessWidget {
  final int index;

  const DescriptionPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var praias = getPraias(); // Obtenha as praias novamente aqui

    // Informações de como chegar
    var comoChegar = {
      'Carro':
          'Para chegar a Ilhabela de carro, parta de São Paulo pela Rodovia dos Tamoios (SP-099) em direção a Caraguatatuba. Na altura do km 16, conecte-se à Rodovia Rio-Santos (BR-101) até Caraguatatuba. Depois, siga as placas para a SP-131, que leva ao ferryboat, com uma travessia de cerca de 15 minutos. Após desembarcar, você estará em Ilhabela, pronto para explorar suas belas praias e atrações. É recomendável verificar os horários do ferryboat, especialmente nos fins de semana e feriados, pois pode haver filas.',
      'Jipe':
          'Para chegar a Ilhabela de jipe, siga pela Rodovia dos Tamoios (SP-099) ou pela Rodovia Rio-Santos (BR-101) até o ponto de embarque do ferryboat em São Sebastião. O acesso é feito pela mesma rota de carro, mas o jipe permite explorar trilhas off-road assim que você desembarcar. Após a travessia de cerca de 15 minutos, você pode aproveitar as estradas e trilhas que levam às praias mais remotas e às belezas naturais da ilha. É importante estar preparado para o terreno irregular e, se possível, verificar as condições das trilhas antes de partir.',
      'Barco':
          'Para chegar a Ilhabela de barco, você pode embarcar em uma das embarcações que partem de São Sebastião. O trajeto leva cerca de 15 a 20 minutos e oferece vistas panorâmicas da costa. Existem diferentes opções de serviços, desde barcos de passeio até embarcações particulares. Ao desembarcar, você pode explorar a ilha, suas praias e trilhas. É importante verificar os horários de saída e a disponibilidade de serviços, especialmente durante a alta temporada, para garantir uma viagem tranquila.',
    };

    // Acessando a praia correspondente
    var praia = praias[index];

    return Scaffold(
      appBar: AppBar(
        title: Text(praia.nome),
        backgroundColor: const Color(0xFF5685B1), // Cor da AppBar
      ),
      body: Container(
        color: const Color(0xFF5685B1), // Cor de fundo
        child: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centralizar conteúdo
              children: [
                // Exibindo a imagem da praia sem bordas arredondadas
                Image.asset(
                  praia.imagem,
                  width: 400,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                // Nome da praia centralizado
                Text(
                  praia.nome,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Cor do texto
                  ),
                  textAlign: TextAlign.center, // Centraliza o texto
                ),
                const SizedBox(height: 8),
                // Descrição da praia
                Text(
                  praia.descricao,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Cor do texto
                  ),
                ),
                const SizedBox(height: 16),
                // Informações de como chegar
                const Text(
                  'Como Chegar:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Cor do texto
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '1. De carro: ${comoChegar['Carro']}',
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 12),
                Text(
                  '2. De jipe: ${comoChegar['Jipe']}',
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 12),
                Text(
                  '3. De barco: ${comoChegar['Barco']}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromRGBO(186, 222, 255, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Image.asset('assets/img/inicio.png'),
              iconSize: 60,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InicioPag()),
                );
              },
            ),
            IconButton(
              icon: Image.asset('assets/img/calendario.png'),
              iconSize: 60,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const EventPag()),
                );
              },
            ),
            IconButton(
              icon: Image.asset('assets/img/mapa.png'),
              iconSize: 60,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapaPag()),
                );
              },
            ),
            IconButton(
              icon: Image.asset('assets/img/like.png'),
              iconSize: 60,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const avaliacaoPag()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
