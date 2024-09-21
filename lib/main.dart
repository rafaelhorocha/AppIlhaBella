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
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF608AC7),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset(
                'assets/img/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 0),
            const Text(
              'IlhaBela\nExperience',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 249, 249),
                shadows: [
                  Shadow(
                    offset: Offset(6.0, 6.0),
                    blurRadius: 2.0,
                    color: Colors.black45,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InicioPag()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                backgroundColor: const Color.fromARGB(255, 232, 246, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Entrar',
                    style: TextStyle(
                      color: Color(0xFF608AC7),
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(width: 60),
                  Icon(
                    Icons.arrow_forward,
                    color: Color(0xFF608AC7),
                    size: 26,
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
