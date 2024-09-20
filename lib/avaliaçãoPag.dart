// ignore_for_file: avoid_print, camel_case_types, sort_child_properties_last, file_names, unused_import

import 'package:file_picker/file_picker.dart'; // Pacote para upload de arquivo
import 'package:flutter/material.dart';
import 'package:flutter_application_ilhabela/eventosPag.dart';
import 'package:flutter_application_ilhabela/inicial.dart';
import 'package:flutter_application_ilhabela/main.dart';
import 'package:flutter_application_ilhabela/mapa.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const avaliacaoPag());
}

class avaliacaoPag extends StatelessWidget {
  const avaliacaoPag({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: ExperienceScreen(),
        bottomNavigationBar: CustomBottomNavBar(), // Adicionado aqui
      ),
    );
  }
}

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(86, 133, 177, 1), // Cor de fundo RGBA
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centraliza o conteúdo
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Centraliza o texto inicial
                children: [
                  const Text(
                    'COMPARTILHE SUA EXPERIÊNCIA\ncom os outros usuários do app!',
                    textAlign: TextAlign.center, // Centraliza o texto
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Cor do texto branco
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Container(
                      width: 400, // Reduz a largura do container
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(
                            217, 217, 217, 1), // Cor do container
                        borderRadius:
                            BorderRadius.circular(10), // Borda arredondada
                      ),
                      padding:
                          const EdgeInsets.all(16.0), // Espaçamento interno
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextField(
                            decoration: InputDecoration(
                              hintText: 'Deixe uma mensagem...',
                              hintStyle: TextStyle(
                                  color: Colors.grey), // Cor do texto de dica
                              border: InputBorder.none, // Remover borda
                            ),
                            maxLines: 3,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text('Avalie sua experiência: '),
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize:
                                    20.0, // Diminui o tamanho das estrelas
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          MouseRegion(
                            cursor: SystemMouseCursors
                                .click, // Define o cursor de clique
                            child: ElevatedButton(
                              onPressed: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles();

                                if (result != null) {
                                  PlatformFile file = result.files.first;
                                  print('Arquivo selecionado: ${file.name}');
                                  // Lógica para tratar o arquivo selecionado
                                } else {
                                  print('Nenhum arquivo selecionado.');
                                }
                              },
                              child:
                                  const Text('Faça o upload de um arquivo...'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const Divider(color: Colors.white), // Divisor branco
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Veja as postagens e avaliações de pessoas que seguiram nossas dicas:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Texto em branco
                ),
              ),
            ),
            const PostList(),
          ],
        ),
      ),
    );
  }
}

// Custom Bottom Navigation Bar
class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromRGBO(186, 222, 255, 1), // Background da barra
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Image.asset('assets/img/inicio.png'), // Caminho da imagem
            iconSize: 60,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InicioPag()),
              );
            },
          ),
          IconButton(
            icon: Image.asset('assets/img/calendario.png'), // Caminho da imagem
            iconSize: 60,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const EventPag()));
            },
          ),
          IconButton(
            icon: Image.asset('assets/img/mapa.png'), // Caminho da imagem
            iconSize: 60,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MapaPag()),
              );
            },
          ),
          IconButton(
            icon: Image.asset('assets/img/like.png'), // Caminho da imagem
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
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        PostItem(
          imageUrl: 'assets/img/foto.png', // Caminho para a imagem local
          title: 'Praia Copá Mitsubishi',
          rating: 4,
        ),
        PostItem(
          imageUrl: 'assets/img/foto1.png', // Caminho para a imagem local
          title: 'Restaurante Belo Mar',
          rating: 5,
        ),
      ],
    );
  }
}

class PostItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int rating;

  const PostItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                RatingBarIndicator(
                  rating: rating.toDouble(),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 20.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
