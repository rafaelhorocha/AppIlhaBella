// ignore_for_file: unused_import, deprecated_member_use, unused_element, file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_ilhabela/eventosPag.dart';
import 'package:url_launcher/url_launcher.dart';

import 'eventos.dart';

class EventCalendar extends StatelessWidget {
  final Evento evento;

  const EventCalendar({super.key, required this.evento});

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(evento.links);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          evento.nome,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF5685B1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  width: 350,
                  decoration: BoxDecoration(
                    color: const Color(0xFFA0C8EE),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        evento.nome,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF05335E),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          evento.imagem,
                          width: 200,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        evento.descricao,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 20),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: const TextStyle(fontSize: 16),
                          children: [
                            const TextSpan(
                              text: 'Data: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF05335E),
                              ),
                            ),
                            TextSpan(
                              text: evento.data,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: const TextStyle(fontSize: 16),
                          children: [
                            const TextSpan(
                              text: 'Hora: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF05335E),
                              ),
                            ),
                            TextSpan(
                              text: evento.hora,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          style: const TextStyle(fontSize: 16),
                          children: [
                            const TextSpan(
                              text: 'Local: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF05335E),
                              ),
                            ),
                            TextSpan(
                              text: evento.local,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _launchURL,
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          foregroundColor: const Color(0xFF05335E),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                        ),
                        child: const Text(
                          'Mais informações',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF5685B1),
    );
  }
}
