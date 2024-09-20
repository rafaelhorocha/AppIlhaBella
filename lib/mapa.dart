// ignore_for_file: sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_ilhabela/avalia%C3%A7%C3%A3oPag.dart';
import 'package:flutter_application_ilhabela/eventosPag.dart';
import 'package:flutter_application_ilhabela/inicial.dart';
import 'package:flutter_application_ilhabela/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MapaPag());
}

class MapaPag extends StatelessWidget {
  const MapaPag({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapa de Ilhabela',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng _center =
      const LatLng(-23.778, -45.358); // Coordenadas aproximadas de Ilhabela

  final Set<Marker> _markers = {
    Marker(
      markerId: const MarkerId('marker1'),
      position: const LatLng(-23.779, -45.357),
      infoWindow: const InfoWindow(title: 'Local 1'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    Marker(
      markerId: const MarkerId('marker2'),
      position: const LatLng(-23.781, -45.355),
      infoWindow: const InfoWindow(title: 'Local 2'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
    Marker(
      markerId: const MarkerId('marker3'),
      position: const LatLng(-23.780, -45.360),
      infoWindow: const InfoWindow(title: 'Local 3'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mapa da Cidade de Ilhabela',
          style: TextStyle(color: Colors.white), // Cor do texto
        ),
        centerTitle: true, // Centraliza o título
        backgroundColor:
            const Color.fromRGBO(86, 133, 177, 1), // Cor do fundo da AppBar
      ),
      body: Container(
        color: const Color.fromRGBO(86, 133, 177, 1), // Cor de fundo da tela
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 400, // Defina a largura desejada
                  height: 480, // Defina a altura desejada
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 14.0,
                    ),
                    markers: _markers,
                  ),
                ),
                const SizedBox(height: 20),
                // Outros widgets podem ser adicionados aqui, como botões ou ícones.
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
                Navigator.push(
                  context,
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
