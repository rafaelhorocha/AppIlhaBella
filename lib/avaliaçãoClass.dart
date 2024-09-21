// ignore_for_file: file_names, unused_field, no_leading_underscores_for_local_identifiers

class Avaliacao {
  late String mensagem;
  late String avaliacao;
  late String arquivos;
  late String praia;

  Avaliacao(this.mensagem, this.avaliacao, this.arquivos, this.praia);

  void atualizarMensagem(String newMsg) {
    mensagem = newMsg;
  }

  void atualizarAvaliacao(String newAval) {
    avaliacao = newAval;
  }

  void atualizarpraia(String newAval) {
    praia = newAval;
  }
}
