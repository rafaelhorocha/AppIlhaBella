import 'package:flutter/material.dart';
import 'package:flutter_application_ilhabela/avalia%C3%A7%C3%A3oPag.dart';
import 'package:flutter_application_ilhabela/eventosPag.dart';
import 'package:flutter_application_ilhabela/inicial.dart';
import 'package:flutter_application_ilhabela/mapa.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'eventos.dart';

class EventCalendar extends StatefulWidget {
  final Evento evento;

  const EventCalendar({super.key, required this.evento});

  @override
  _EventCalendarState createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Future<void> _launchURL() async {
    final Uri url = Uri.parse(widget.evento.links);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.evento.nome,
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
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  padding: const EdgeInsets.all(8),
                  width: 400,
                  child: TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    calendarStyle: const CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Color(0xFF05335E),
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Color(0xFF003366),
                        shape: BoxShape.rectangle,
                      ),
                      selectedTextStyle: TextStyle(color: Colors.white),
                      todayTextStyle: TextStyle(color: Colors.white),
                      defaultTextStyle: TextStyle(color: Colors.white),
                      weekendTextStyle: TextStyle(color: Colors.white),
                    ),
                    headerStyle: const HeaderStyle(
                      titleTextStyle:
                          TextStyle(fontSize: 20, color: Colors.black),
                      formatButtonVisible: false,
                      titleCentered: true,
                      leftChevronIcon:
                          Icon(Icons.arrow_left, color: Colors.black),
                      rightChevronIcon:
                          Icon(Icons.arrow_right, color: Colors.black),
                      decoration: BoxDecoration(color: Color(0xFFA0C8EE)),
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekendStyle: TextStyle(color: Colors.white),
                      weekdayStyle: TextStyle(color: Colors.white),
                    ),
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        return Center(
                          child: Text(
                            day.day.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Month',
                    },
                  ),
                ),
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
                        widget.evento.nome,
                        style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF05335E)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          widget.evento.imagem,
                          width: 200,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.evento.descricao,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
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
                                  color: Color(0xFF05335E)),
                            ),
                            TextSpan(
                                text: widget.evento.dia,
                                style: const TextStyle(color: Colors.black)),
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
                                  color: Color(0xFF05335E)),
                            ),
                            TextSpan(
                                text: widget.evento.hora,
                                style: const TextStyle(color: Colors.black)),
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
                                  color: Color(0xFF05335E)),
                            ),
                            TextSpan(
                                text: widget.evento.local,
                                style: const TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _launchURL,
                        style: ElevatedButton.styleFrom(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          foregroundColor: const Color(0xFF05335E),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                        ),
                        child: const Text('Mais informações',
                            style: TextStyle(fontSize: 16)),
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
