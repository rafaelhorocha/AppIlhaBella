class Evento {
  late String nome;
  late String descricao;
  late String links;
  final String imagem;

  Evento(this.nome, this.descricao, this.links, this.imagem);

  void atualizarDescricao(String d) {
    descricao = d;
  }

  void atualizarNome(String n) {
    nome = n;
  }

  void atualizarLinks(String l) {
    links = l;
  }
}

// Lista de eventos
final List<Evento> eventos = [
  Evento('Evento 1', 'Descrição do Evento 1', 'link1.com',
      'assets/img/evento1.png'),
  Evento('Evento 2', 'Descrição do Evento 2', 'link2.com',
      'assets/img/evento2.png'),
  Evento('Evento 3', 'Descrição do Evento 3', 'link3.com',
      'assets/img/evento3.png'),
];
