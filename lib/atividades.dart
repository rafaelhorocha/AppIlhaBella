// ignore_for_file: file_names

class Agenda {
  late String nome;
  late String comoRealizar;
  late int valores;

  Agenda(this.nome, this.comoRealizar, this.valores);

  void atualizarProgramacao(String nomeNew) {
    nome = nomeNew;
  }

  void atualizarReal(String reaizar) {
    comoRealizar = reaizar;
  }

  void atualizarValores(int valor) {
    valores = valor;
  }
}
