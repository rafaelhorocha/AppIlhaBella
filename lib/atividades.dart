// ignore_for_file: file_names

class Atividades {
  late String nome;
  late String comoRealizar;
  late int valores;

  Atividades(this.nome, this.comoRealizar, this.valores);

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
