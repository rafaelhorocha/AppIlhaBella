// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_ilhabela/avalia%C3%A7%C3%A3oPag.dart';
import 'package:flutter_application_ilhabela/eventosCalend.dart';
import 'package:flutter_application_ilhabela/inicial.dart';
import 'package:flutter_application_ilhabela/main.dart';
import 'package:flutter_application_ilhabela/mapa.dart';

import 'eventos.dart';
import 'praia.dart';

// Definição da classe Evento
class Evento {
  late String nome;
  late String descricao;
  late String links;
  final String imagem;

  Evento(this.nome, this.descricao, this.links, this.imagem);

  void atualizarDescricao(String d) {
    descricao = d;
  }

  void atualizarNome(String n) {
    nome = n;
  }

  void atualizarLinks(String l) {
    links = l;
  }
}

// Lista de eventos
final List<Evento> eventos = [
  Evento('Evento 1', 'Descrição do Evento 1', 'link1.com',
      'assets/img/evento1.png'),
  Evento('Evento 2', 'Descrição do Evento 2', 'link2.com',
      'assets/img/evento2.png'),
  Evento('Evento 3', 'Descrição do Evento 3', 'link3.com',
      'assets/img/evento3.png'),
];

void main() {
  runApp(const EventPag());
}

class EventPag extends StatelessWidget {
  const EventPag({super.key});

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
    var praias = getPraias();
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(86, 133, 177, 1),
        child: Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(217, 217, 217, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Selecione a praia',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.transparent,
                        ),
                        items: praias.map((Praia praia) {
                          return DropdownMenuItem<String>(
                            value: praia.nome,
                            child: Text(praia.nome),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            // Aqui você pode fazer qualquer lógica que precisar, como redirecionar
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EventCalendar(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                          TextSpan(text: 'Descubra os principais '),
                          TextSpan(
                            text: 'eventos\n',
                            style: TextStyle(
                              color: Color.fromRGBO(5, 51, 94, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: 'que estão acontecendo nas praias!'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Aqui começa o mosaico de imagens inserido do primeiro código
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/img/volei.png',
                            width: 200,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            'assets/img/img2.png',
                            width: 155,
                            height: 155,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/img/show.png',
                        width: 350,
                        height: 155,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/img/volei2.png',
                            width: 130,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              'assets/img/corrida.jpg',
                              width: 210,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
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
                    MaterialPageRoute(builder: (context) => const EventPag()));
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
