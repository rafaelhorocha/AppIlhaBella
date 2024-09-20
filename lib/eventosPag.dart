// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_ilhabela/avalia%C3%A7%C3%A3oPag.dart';
// Importando a nova tela
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
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Selecione a praia',
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      items:
                          ['Praia 1', 'Praia 2', 'Praia 3'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {},
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

// Código do calendário (EventCalendar) incluído aqui
class EventCalendar extends StatelessWidget {
  const EventCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendário de Eventos'),
      ),
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
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: Text(
              day.toString(),
              style: TextStyle(
                color: isSelected
                    ? const Color(0xFF2B689B) // Azul para o dia selecionado
                    : Colors.black, // Cor para os outros dias
                fontSize: 18,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
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
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: const Color(0xFFA0C8EE), // Cor mais clara para a barra do mês
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => _changeMonth(-1),
                icon: const Icon(Icons.arrow_back),
              ),
              Text(
                DateFormat.yMMMM('pt_BR').format(_focusedDate),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Cor do texto da barra
                ),
              ),
              IconButton(
                onPressed: () => _changeMonth(1),
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 7,
          shrinkWrap: true,
          children: _buildDays(),
        ),
      ],
    );
  }
}
