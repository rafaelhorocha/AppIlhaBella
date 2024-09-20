// ignore_for_file: file_names

class Agenda {
  late int cep;
  late int numero;
  late String logradouro;

  Agenda(this.cep, this.numero, this.logradouro);

  void atualizarCEP(int newcep) {
    cep = newcep;
  }

  void atualizarNumero(int num) {
    numero = num;
  }

  void atualizarlogradouro(String log) {
    logradouro = log;
  }
}
