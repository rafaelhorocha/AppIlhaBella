// ignore_for_file: file_names

class Agenda {
  late String programacao;
  late DateTime data;
  late DateTime horario;

  Agenda(this.programacao, this.horario, this.data);

  void atualizarProgramacao(String p) {
    programacao = p;
  }

  void atualizarData(DateTime d) {
    data = d;
  }

  void atualizarHora(DateTime h) {
    horario = h;
  }
}
