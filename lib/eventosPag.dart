// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_ilhabela/avalia%C3%A7%C3%A3oPag.dart';
import 'package:flutter_application_ilhabela/eventosCalend.dart'; // Importando a nova tela
import 'package:flutter_application_ilhabela/inicial.dart';
import 'package:flutter_application_ilhabela/mapa.dart';
import 'package:intl/date_symbol_data_local.dart'; // Importando para inicializar
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null); // Inicializando a localização
  runApp(const EventPag());
}

class EventPag extends StatelessWidget {
  const EventPag({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botão com Imagem e Texto',
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        // Redirecionar para a tela de eventos
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EventCalendar()),
                        );
                      },
                      child: const Text(
                        'Ver Eventos',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
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
