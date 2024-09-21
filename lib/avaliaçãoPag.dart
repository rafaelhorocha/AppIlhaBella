// ignore_for_file: avoid_print, camel_case_types, sort_child_properties_last, file_names, unused_import

import 'package:file_picker/file_picker.dart';
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
        bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(86, 133, 177, 1),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'COMPARTILHE SUA EXPERIÊNCIA\ncom os outros usuários do app!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Container(
                      width: 400,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(217, 217, 217, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextField(
                            decoration: InputDecoration(
                              hintText: 'Deixe uma mensagem...',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
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
                                itemSize: 20.0,
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
                            cursor: SystemMouseCursors.click,
                            child: ElevatedButton(
                              onPressed: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles();

                                if (result != null) {
                                  PlatformFile file = result.files.first;
                                  print('Arquivo selecionado: ${file.name}');
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
            const Divider(color: Colors.white),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Veja as postagens e avaliações de pessoas que seguiram nossas dicas:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
          imageUrl: 'assets/img/foto.png',
          title: 'Praia Copá Mitsubishi',
          rating: 4,
        ),
        PostItem(
          imageUrl: 'assets/img/foto1.png',
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
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(86, 133, 177, 1).withOpacity(0.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 300,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 10),
                RatingBarIndicator(
                  rating: rating.toDouble(),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 15.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
