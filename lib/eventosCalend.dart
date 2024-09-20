// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_ilhabela/avalia%C3%A7%C3%A3oPag.dart';
import 'package:flutter_application_ilhabela/eventosCalend.dart';
import 'package:flutter_application_ilhabela/eventosPag.dart';
import 'package:flutter_application_ilhabela/inicial.dart';
import 'package:flutter_application_ilhabela/main.dart';
import 'package:flutter_application_ilhabela/mapa.dart';
import 'package:intl/date_symbol_data_local.dart'; // Import necessário para inicializar os dados de localização
import 'package:intl/intl.dart'; // Import necessário para exibir o nome do mês

void main() async {
  // Certifique-se de inicializar a formatação de data antes de rodar o app
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null); // Inicializando para português

  runApp(const EventCalendar());
}

class EventCalendar extends StatelessWidget {
  const EventCalendar({super.key});

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
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(86, 133, 177, 1), // Cor de fundo
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
                        items: ['Praia 1', 'Praia 2', 'Praia 3']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Calendário personalizado
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(
                            0xFFA0C8EE), // Cor da borda do calendário
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const CustomCalendar(), // Componente do calendário
                  ),
                  const SizedBox(height: 40),
                  const SizedBox(height: 40),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
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
              icon:
                  Image.asset('assets/img/calendario.png'), // Caminho da imagem
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
      ),
    );
  }
}

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _focusedDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  void _changeMonth(int delta) {
    setState(() {
      _focusedDate = DateTime(
        _focusedDate.year,
        _focusedDate.month + delta,
      );
    });
  }

  List<Widget> _buildDays() {
    int daysInMonth =
        DateUtils.getDaysInMonth(_focusedDate.year, _focusedDate.month);

    return List.generate(daysInMonth, (index) {
      final day = index + 1;
      final date = DateTime(_focusedDate.year, _focusedDate.month, day);
      final isSelected = _selectedDate.day == day &&
          _selectedDate.month == _focusedDate.month &&
          _selectedDate.year == _focusedDate.year;

      return GestureDetector(
        onTap: () {
          setState(() {
            _selectedDate = date;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF2B689B) // Azul para o dia selecionado
                : Colors.transparent,
          ),
          child: Center(
            child: Text(
              day.toString(),
              style: const TextStyle(
                color: Colors.white, // Letra branca para todos os dias
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Cabeçalho com o nome do mês e setas para navegação
        Container(
          color: const Color(0xFFA0C8EE), // Cor da barra dos meses
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => _changeMonth(-1),
                icon: const Icon(Icons.arrow_left, color: Colors.black),
              ),
              Text(
                DateFormat('MMMM y', 'pt_BR')
                    .format(_focusedDate)
                    .toUpperCase(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Cor preta para o mês e o ano
                ),
              ),
              IconButton(
                onPressed: () => _changeMonth(1),
                icon: const Icon(Icons.arrow_right, color: Colors.black),
              ),
            ],
          ),
        ),
        // Semana (S T Q Q S S D)
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('S', style: TextStyle(fontSize: 16, color: Colors.white)),
              Text('T', style: TextStyle(fontSize: 16, color: Colors.white)),
              Text('Q', style: TextStyle(fontSize: 16, color: Colors.white)),
              Text('Q', style: TextStyle(fontSize: 16, color: Colors.white)),
              Text('S', style: TextStyle(fontSize: 16, color: Colors.white)),
              Text('S', style: TextStyle(fontSize: 16, color: Colors.white)),
              Text('D', style: TextStyle(fontSize: 16, color: Colors.white)),
            ],
          ),
        ),
        // Grade de dias
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 7,
          children: _buildDays(),
        ),
      ],
    );
  }
}
